import 'dart:convert';
import 'dart:developer';

import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/data/models/adres_model.dart';
import 'package:feedbackstation/app/data/models/media_model.dart';
import 'package:feedbackstation/app/data/models/permission_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/modules/login/controllers/login_controller.dart';
import 'package:feedbackstation/app/services/API/api.dart';
import 'package:feedbackstation/app/utils/session.dart';
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed("/Password");
                      },
                      child: const Text(
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
                        onPressed: () async {
                          final apiService = APIServices();

                          Map<String, String> formData = {
                            "tc_identity":
                                controller.loginController.value.text,
                            "password":
                                controller.passwordController.value.text,
                          };
                          final Map<String, dynamic> getUsersResult =
                              await apiService.login(formData: formData);

                          if (getUsersResult['status'] != true) {
                            print('Hata: ${getUsersResult['error']}');

                            Get.snackbar(
                              "Sistem",
                              getUsersResult['message'].toString(),
                              colorText: Colors.white,
                              backgroundColor: Colors.black38,
                              duration: const Duration(seconds: 4),
                            );
                            return;
                          }

                          var userInfo = getUsersResult['response']['user'];
                          AppSession.user = User(
                            id: 1,
                            permission: controller.selectedIndex.value == 1
                                ? PermissionModel(
                                    name: "Müdür",
                                    category: "Bilgi İşlem",
                                    canShowAdminPanel: true,
                                    canEditUser: true,
                                    canDeleteUser: true,
                                    canResponseRequest: true,
                                    canUploadAvatar: true,
                                    canAddFeedbackCategory: true,
                                    canDeleteFeedbackCategory: true,
                                    canReportRequest: true,
                                    canEditmyProfile: true,
                                  )
                                : PermissionModel(
                                    name: "Kullanıcı",
                                    category: "Vatandaş",
                                    canShowAdminPanel: false,
                                    canEditUser: false,
                                    canDeleteUser: false,
                                    canResponseRequest: false,
                                    canUploadAvatar: false,
                                    canAddFeedbackCategory: false,
                                    canDeleteFeedbackCategory: false,
                                    canReportRequest: false,
                                    canEditmyProfile: true,
                                  ),
                            displayname: userInfo["name"],
                            email: userInfo["email"],
                            firstname: userInfo["firstname"],
                            lastname: userInfo["lastname"],
                            phonenumber: userInfo["phonenumber"],
                            serialNumber: userInfo["tc_identity"],
                            avatar: Media(
                              id: 0,
                              type: MediaType.image,
                              isLocal: false,
                              bigUrl:
                                  "https://www.indyturk.com/sites/default/files/styles/1368x911/public/article/main_image/2023/05/29/1148686-855586519.jpg?itok=G1u1wA05",
                              minUrl:
                                  "https://www.indyturk.com/sites/default/files/styles/1368x911/public/article/main_image/2023/05/29/1148686-855586519.jpg?itok=G1u1wA05",
                              normalUrl:
                                  "https://www.indyturk.com/sites/default/files/styles/1368x911/public/article/main_image/2023/05/29/1148686-855586519.jpg?itok=G1u1wA05",
                            ),
                            gender: Gender.male,
                            address: AddresModel(
                              neighbourhood: "Mustafa Kemal Paşa Mahallesi",
                              streetAvenue: "Sahil Caddesi",
                              streetAvenueAlley: "",
                              // insideDoor: "4",
                              // outDoor: "441",
                              neighborhoodDirections: "Bimin üstündeyiz",
                            ),
                          );

                          Get.offNamed("/home");
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
