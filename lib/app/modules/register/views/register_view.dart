import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/modules/register/controllers/register_controller.dart';
import 'package:feedbackstation/app/widgets/partical_widget.dart';
import 'package:feedbackstation/app/widgets/textfields_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:particles_flutter/particles_engine.dart';

class RegisterpageView extends StatelessWidget {
  const RegisterpageView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());

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
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 5,
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppInfo.appImage,
                            scale: 3,
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => TextfieldWidget.costum2(
                              controller: controller.tcconttroller.value,
                              label: "TC Kimlik",
                              icon: Icons.person,
                              isDigitalNumber: true,
                              maxLength: 11,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => TextfieldWidget.costum2(
                              controller: controller.adconttroller.value,
                              label: "Ad",
                              icon: Icons.person,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => TextfieldWidget.costum2(
                              controller: controller.soyAdconttroller.value,
                              label: "Soyad",
                              icon: Icons.person,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => TextfieldWidget.costum2(
                              controller: controller.telnoconttroller.value,
                              label: "Telefon Numarası",
                              icon: Icons.phone,
                              isDigitalNumber: true,
                              maxLength: 11,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => TextfieldWidget.costum2(
                              controller: controller.mailconttroller.value,
                              label: "E posta Adresi",
                              icon: Icons.security,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => TextfieldWidget.costum2(
                              controller: controller.parolaconttroller.value,
                              label: "Parola",
                              icon: Icons.security,
                              isPassword: true,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => TextfieldWidget.costum2(
                              controller: controller.parola2conttroller.value,
                              label: "Parolayı Tekrar Giriniz",
                              icon: Icons.security,
                              isPassword: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Obx(
                                      () => Checkbox(
                                        value: controller.kvkkcheck.value,
                                        onChanged: (val) {
                                          controller.kvkkcheck.value = val!;
                                        },
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.dialog(
                                          Center(
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20),
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  color: Colors.white70,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          AppInfo.kvkk.title,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        AppInfo.kvkk.context,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: const Text(
                                                            "Okudum "),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          barrierDismissible: false,
                                        );
                                      },
                                      child: const SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Text(
                                              "(KVKK)",
                                              style: TextStyle(
                                                color: Colors.red,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.amber,
                                                decorationThickness: 0.5,
                                              ),
                                            ),
                                            Text(
                                              " hakkında bilgilendirmeyi okudum onaylıyorum",
                                              style: TextStyle(
                                                color: Colors.amber,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async => await controller.register(),
                            child: const Text(
                              "Kayıt ol",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
