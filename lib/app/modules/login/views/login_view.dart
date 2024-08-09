import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/modules/homepage/views/homepage_view.dart';
import 'package:feedbackstation/app/modules/login/controllers/login_controller.dart';
import 'package:feedbackstation/app/modules/user/views/user_view.dart';
import 'package:feedbackstation/app/widgets/textfields_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    // return Obx(() {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 45, 80),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 4,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              Image.asset(
                AppInfo.appImage,
                scale: 3,
              ),
              const SizedBox(height: 15),
              Obx(() {
                return ToggleButtons(
                  color: Colors.grey,
                  borderColor: Colors.grey,
                  selectedColor: Colors.white,
                  selectedBorderColor: Colors.blue,
                  fillColor: Colors.blue,
                  isSelected: List.generate(
                      2, (index) => index == controller.selectedIndex.value),
                  onPressed: (int index) {
                    controller.updateSelectedIndex(index);
                  },
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Vatandaş Girişi'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Personel Girişi'),
                    ),
                  ],
                );
              }),
              TextfieldWidget.costum2(
                controller: controller.loginController,
                label: "TC Kimlik",
                icon: Icons.person,
                isDigitalNumber: true,
                maxLength: 11,
              ),
              const SizedBox(height: 15),
              TextfieldWidget.costum2(
                controller: controller.passwordController,
                label: "Parola",
                icon: Icons.security,
                isPassword: true,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: null,
                  child: Text(
                    "Şifremi unuttum!",
                  ),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (!GetUtils.isNumericOnly(
                          controller.loginController.text)) {
                        Get.snackbar("Hata", "Numaratik Değil");
                        return;
                      }
                      if (controller.loginController.text != "00000000000") {
                        Get.snackbar("Hata", "Yanlış TC kimlik numarası");
                        return;
                      }

                      if (controller.passwordController.text != "123") {
                        Get.snackbar(
                          "Hata",
                          "Parola",
                        );
                        return;
                      }

                      Get.off(() => const UserView());
                    },
                    child: const Text(
                      "Kayıt ol",
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Get.off(() => const HomepageView());
                    },
                    child: const Text("Giriş Yap"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // });
  }
}
