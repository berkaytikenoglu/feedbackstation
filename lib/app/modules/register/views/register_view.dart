import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/data/models/adres_model.dart';
import 'package:feedbackstation/app/data/models/media_model.dart';
import 'package:feedbackstation/app/data/models/permission_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/modules/register/controllers/register_controller.dart';
import 'package:feedbackstation/app/utils/session.dart';
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
                              isPassword: true,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => TextfieldWidget.costum2(
                              controller: controller.soyAdconttroller.value,
                              label: "Soyad",
                              icon: Icons.person,
                              isPassword: true,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => TextfieldWidget.costum2(
                              controller: controller.telnoconttroller.value,
                              label: "Telefon Numarası",
                              icon: Icons.phone,
                              isPassword: true,
                              isDigitalNumber: true,
                              maxLength: 11,
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
                            onPressed: () {
                              AppSession.user = User(
                                id: 1,
                                permission: PermissionModel(
                                  name: "Müdür",
                                  category: "Bilgi İşlem",
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
                                displayname: "Tony Stark",
                                email: "ironman@maniron.com",
                                firstname: "Tony",
                                lastname: "Stark",
                                phonenumber: "5054442521",
                                serialNumber: "29675478652",
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

                              Get.toNamed("/home/user");
                            },
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
