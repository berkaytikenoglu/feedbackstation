import 'dart:convert';

import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/data/models/addres_model.dart';
import 'package:feedbackstation/app/data/models/media_model.dart';
import 'package:feedbackstation/app/data/models/permission_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/modules/login/controllers/login_controller.dart';
import 'package:feedbackstation/app/services/API/api.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:feedbackstation/app/widgets/button_widget.dart';
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
                horizontal: MediaQuery.of(context).size.width < 500
                    ? 20
                    : MediaQuery.of(context).size.width / 5,
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
                  TextfieldWidget.costum2(
                    controller: controller.loginController.value,
                    label: "TC Kimlik",
                    icon: Icons.person,
                    isDigitalNumber: true,
                    maxLength: 11,
                  ),
                  const SizedBox(height: 15),
                  TextfieldWidget.costum2(
                    controller: controller.passwordController.value,
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
                      Obx(
                        () => ButtonsWidget.costum1(
                          loadingStatus: controller.loginstatus.value,
                          onPressed: () async {
                            final apiService = APIServices(
                              userTOKEN: AppSession.userTOKEN.toString(),
                            );

                            controller.loginstatus.value = true;
                            final Map<String, dynamic> getUsersResult =
                                await apiService.login(
                              tcIdentity: controller.loginController.value.text,
                              password:
                                  controller.passwordController.value.text,
                            );
                            controller.loginstatus.value = false;

                            if (getUsersResult['status'] != true) {
                              Get.snackbar(
                                "Sistem",
                                getUsersResult['message'].toString(),
                                colorText: Colors.white,
                                backgroundColor: Colors.black38,
                              );
                              return;
                            }

                            var userInfo = getUsersResult['response']['user'];
                            AppSession.userTOKEN =
                                getUsersResult['response']['access_token'];
                            AppSession.user = User(
                              id: userInfo['id'],
                              permission: PermissionModel(
                                name: userInfo['permission']['name'],
                                category: userInfo['permission']['category'],
                                canShowAdminPanel: userInfo['permission']
                                            ['canshowadminpanel'] ==
                                        1
                                    ? true
                                    : false,
                                canEditUser:
                                    userInfo['permission']['canedituser'] == 1
                                        ? true
                                        : false,
                                canDeleteUser: true,
                                canResponseRequest: userInfo['permission']
                                            ['canresponserequest'] ==
                                        1
                                    ? true
                                    : false,
                                canResponseRequestlist:
                                    userInfo['canresponserequestlist'] == null
                                        ? null
                                        : json.decode(
                                            userInfo['canresponserequestlist']),
                                canUploaduserAvatar: userInfo['permission']
                                            ['canuploaduseravatar'] ==
                                        1
                                    ? true
                                    : false,
                                canAddFeedbackCategory: userInfo['permission']
                                            ['canaddfeedbackcategory'] ==
                                        1
                                    ? true
                                    : false,
                                canDeleteFeedbackCategory:
                                    userInfo['permission']
                                                ['candeletefeedbackcategory'] ==
                                            1
                                        ? true
                                        : false,
                                canReportRequest: userInfo['permission']
                                            ['canreportrequest'] ==
                                        1
                                    ? true
                                    : false,
                                canEditmyProfile: userInfo['permission']
                                            ['caneditmyprofile'] ==
                                        1
                                    ? true
                                    : false,
                                canDeletemyProfile: userInfo['permission']
                                            ['candeletemyprofile'] ==
                                        1
                                    ? true
                                    : false,
                                canUploadAvatarmyProfile: userInfo['permission']
                                            ['canuploaduseravatarmyprofile'] ==
                                        1
                                    ? true
                                    : false,
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
                                bigUrl: userInfo["big_avatar"],
                                normalUrl: userInfo["normal_avatar"],
                                minUrl: userInfo["min_avatar"],
                              ),
                              gender: Gender.male,
                              address: userInfo["address"] == null
                                  ? null
                                  : AddresModel(
                                      neighbourhood: userInfo["address"]
                                          ["neighbourhood"],
                                      street: userInfo["address"]["street"],
                                      insidedoor: userInfo["address"]
                                          ["insidedoor"],
                                      outdoor: userInfo["address"]["outdoor"],
                                      description: userInfo["address"]
                                          ["description"],
                                    ),
                            );

                            Get.offNamed("/home");
                          },
                          text: "Giriş YAP",
                        ),
                      ),
                      // ElevatedButton(
                      //   child: const Text("Giriş Yap"),
                      // )
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
