import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/modules/login/controllers/login_controller.dart';
import 'package:feedbackstation/app/widgets/partical_widget.dart';
import 'package:feedbackstation/app/widgets/textfields_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:particles_flutter/particles_engine.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 45, 80),
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: const Color.fromARGB(255, 2, 45, 80),
            child: Particles(
              awayRadius: 100,
              particles: ParticalWidget.createParticles(),
              height: Get.height,
              width: Get.width,
              onTapAnimation: true,
              awayAnimationDuration: const Duration(milliseconds: 10000),
              awayAnimationCurve: Curves.easeInBack,
              enableHover: true,
              hoverRadius: 80,
              connectDots: true,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 5,
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ToggleButtons(
                        color: Colors.grey,
                        borderColor: Colors.grey,
                        selectedColor: Colors.white,
                        selectedBorderColor: Colors.blue,
                        fillColor: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        isSelected: List.generate(2,
                            (index) => index == controller.selectedIndex.value),
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
                      ),
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
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/register");
                        },
                        child: const Text(
                          "Kayıt ol",
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.selectedIndex.value == 1) {
                            Get.offNamed("/home/admin");
                          } else {
                            Get.offNamed("/home/user");
                          }
                        },
                        child: const Text("Giriş Yap"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
