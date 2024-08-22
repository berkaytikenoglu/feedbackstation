import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/modules/password/controllers/password_controllers.dart';

import 'package:feedbackstation/app/widgets/partical_widget.dart';
import 'package:feedbackstation/app/widgets/textfields_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:particles_flutter/particles_engine.dart';

class PasswordpageView extends StatelessWidget {
  const PasswordpageView({super.key});

  @override
  Widget build(BuildContext context) {
    final PasswordController controller = Get.put(PasswordController());

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
                  horizontal: MediaQuery.of(context).size.width < 500
                      ? 20
                      : MediaQuery.of(context).size.width / 5,
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
                            () => Visibility(
                              visible: controller.infocontroller.value,
                              child: TextfieldWidget.costum2(
                                controller: controller.tcconttroller.value,
                                label: "TC Kimlik No",
                                icon: Icons.person,
                                isDigitalNumber: true,
                                maxLength: 11,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => Visibility(
                              visible: controller.infocontroller.value,
                              child: TextfieldWidget.costum2(
                                controller: controller.telnoconttroller.value,
                                label: "Telefon Numarası",
                                icon: Icons.phone,
                                isDigitalNumber: true,
                                maxLength: 11,
                              ),
                            ),
                          ),
                          Obx(
                            () => Visibility(
                              visible: controller.infocontroller.value,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.smscontroller.value = true;
                                  controller.infocontroller.value = false;
                                  controller.startTimer();
                                },
                                child: const Text(
                                  "SMS Kodu iste",
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => Visibility(
                              visible: controller.smscontroller.value,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      CircularProgressIndicator(
                                        strokeWidth: 8,
                                        value: controller.count.value / 60,
                                        color: controller.count.value < 30
                                            ? Colors.red
                                            : Colors.green,
                                      ),
                                      Center(
                                        child: Text(
                                          controller.count.value.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 60,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => Visibility(
                              visible: controller.smscontroller.value,
                              child: TextfieldWidget.costum2(
                                controller: controller.smsTextController.value,
                                label: "Sms Kodunu Giriniz",
                                icon: Icons.phone,
                              ),
                            ),
                          ),
                          Obx(
                            () => Visibility(
                              visible: controller.smscontroller.value,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.smscontroller.value = false;
                                  controller.newpasswordcontroller.value = true;
                                },
                                child: const Text("Devam"),
                              ),
                            ),
                          ),
                          Obx(
                            () => Visibility(
                              visible: controller.newpasswordcontroller.value,
                              child: TextfieldWidget.costum2(
                                controller: controller.parolaconttroller.value,
                                label: "Yeni Şifrenizi Giriniz",
                                icon: Icons.password,
                              ),
                            ),
                          ),
                          Obx(
                            () => Visibility(
                              visible: controller.newpasswordcontroller.value,
                              child: TextfieldWidget.costum2(
                                controller: controller.parola2conttroller.value,
                                label: "Yeni Şifrenizi Tekrar Girinizı",
                                icon: Icons.password,
                              ),
                            ),
                          ),
                          Obx(
                            () => Visibility(
                              visible: controller.newpasswordcontroller.value,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.offNamed("/home/user");
                                },
                                child: const Text("Devam"),
                              ),
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
