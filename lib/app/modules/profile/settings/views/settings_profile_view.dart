import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/modules/profile/settings/controllers/settings_profile_controller.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';
import 'package:feedbackstation/app/widgets/editinglisttile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsProfileView extends StatelessWidget {
  const SettingsProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsProfileController controller =
        Get.put(SettingsProfileController());

    return Obx(
      () => Scaffold(
        appBar: const AppbarWidget(title: "Ayarlar"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await controller.filepicker();
                                  log(421412);
                                },
                                child: Obx(
                                  () => CircleAvatar(
                                    radius: 100,
                                    foregroundImage: CachedNetworkImageProvider(
                                      controller.avatar.value!.minUrl,
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  controller.displayname.value == null
                                      ? ""
                                      : controller.displayname.value!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  controller.userpermission.value == null
                                      ? ""
                                      : controller.userpermission.value!.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Text(
                                controller.userpermission.value == null
                                    ? ""
                                    : controller.userpermission.value!.category
                                        .toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.blue,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "Profil Durumu",
                                          textAlign: TextAlign.start,
                                        ),
                                        const Spacer(),
                                        Obx(
                                          () => Text(
                                            "%${(controller.countinfooaflk.value / 13 * 100).toStringAsFixed(2)}",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Obx(
                                      () => LinearProgressIndicator(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        value: controller.countinfooaflk.value
                                                .toInt() /
                                            13,
                                        minHeight: 15,
                                        backgroundColor: Colors.grey,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                title: const Text(
                                  'Hesap ID',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                  controller.userid.value == null
                                      ? ""
                                      : controller.userid.toString(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            child: TabBar(
                              controller: controller.tabbarController,
                              tabs: const [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("Kullanıcı Bilgileri"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("Erişim Bilgileri"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 500,
                            child: TabBarView(
                                controller: controller.tabbarController,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            "Kullanıcı Bilgileri",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "Ad",
                                          text:
                                              controller.firstname.value == null
                                                  ? ""
                                                  : controller.firstname.value!,
                                          function: (result) {
                                            controller.updateFirstName(result);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "Soyad",
                                          text:
                                              controller.lastname.value == null
                                                  ? ""
                                                  : controller.lastname.value!,
                                          function: (result) {
                                            controller.updateLastName(result);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "TC No",
                                          text: controller.tcno.value == null
                                              ? ""
                                              : controller.tcno.value!,
                                          function: (result) {
                                            controller.updatetcno(result);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "E-posta",
                                          text: controller.mail.value == null
                                              ? ""
                                              : controller.mail.value!,
                                          function: (result) {
                                            controller.updatemail(result);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "Telefon Numarası",
                                          text: controller.phone.value == null
                                              ? ""
                                              : controller.phone.value!,
                                          function: (result) {
                                            controller.updatephone(result);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "Cinsiyet",
                                          text: controller.gender.value == null
                                              ? ""
                                              : controller.gender.value!,
                                          function: (result) {
                                            controller.updategender(result);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            "Adres Bilgileri",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(height: 200),

                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "Mahalle",
                                          text: controller
                                                      .neighbourhood.value ==
                                                  null
                                              ? ""
                                              : controller.neighbourhood.value!,
                                          function: (result) {
                                            controller.updateneighbour(result);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "Sokak-Cadde",
                                          text: controller.streetAvenue.value ==
                                                  null
                                              ? ""
                                              : controller.streetAvenue.value!,
                                          function: (result) {
                                            controller
                                                .updatestreetAvenue(result);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "Sokak-Cadde_Ara",
                                          text: controller.streetAvenueAlley
                                                      .value ==
                                                  null
                                              ? ""
                                              : controller
                                                  .streetAvenueAlley.value!,
                                          function: (result) {
                                            controller.updatestreetAvenueAlley(
                                                result);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "Dış Kapı No",
                                          text: controller.outDoor.value == null
                                              ? ""
                                              : controller.outDoor.value!,
                                          function: (result) {
                                            controller.updateoutDoor(result);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "iç Kapı No",
                                          text: controller.insideDoor.value ==
                                                  null
                                              ? ""
                                              : controller.insideDoor.value!,
                                          function: (result) {
                                            controller.updateinsideDoor(result);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => EditingListTileWidget.custom1(
                                          title: "Adres Tarifi",
                                          text: controller
                                                      .neighborhoodDirections
                                                      .value ==
                                                  null
                                              ? ""
                                              : controller
                                                  .neighborhoodDirections
                                                  .value!,
                                          function: (result) {
                                            controller
                                                .updateneighborhoodDirections(
                                                    result);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
