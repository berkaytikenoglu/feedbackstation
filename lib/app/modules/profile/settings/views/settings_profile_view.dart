import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/data/models/addres_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/modules/profile/settings/controllers/settings_profile_controller.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';
import 'package:feedbackstation/app/widgets/editinglisttile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsProfileView extends StatelessWidget {
  const SettingsProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments;

    User profileUser = arg['user'];
    final SettingsProfileController controller =
        Get.put(SettingsProfileController(profileUser: profileUser));
    return Scaffold(
      appBar: const AppbarWidget(title: "Ayarlar"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  var widget1 = SizedBox(
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
                              },
                              child: Obx(
                                () => Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 140,
                                      foregroundImage:
                                          CachedNetworkImageProvider(
                                        controller.avatar.value!.bigUrl,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -2,
                                      child: IconButton(
                                        icon: const Icon(
                                            Icons.edit), // Buton simgesi
                                        color: Colors.black, // Simge rengi
                                        iconSize: 40.0, // Simgenin boyutu
                                        onPressed: () async {
                                          await controller.filepicker();
                                        },
                                      ),
                                    ),
                                  ],
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
                                textAlign: TextAlign.right,
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
                            AppSession.user.permission!.canDeleteUser == false
                                ? Container()
                                : ElevatedButton(
                                    onPressed: () {
                                      Get.dialog(
                                        Dialog(
                                          child: Container(
                                            width: 350,
                                            height: 100,
                                            color: Colors.white,
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                    "Hesabı Silmek İstediğinizden Emin misiniz?"),
                                                Row(
                                                  children: [
                                                    const Spacer(),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        controller
                                                            .deleteprofile(
                                                                userID:
                                                                    profileUser
                                                                        .id!);
                                                      },
                                                      child: const Text("Evet"),
                                                    ),
                                                    const Spacer(),
                                                    const ElevatedButton(
                                                      onPressed: null,
                                                      child: Text("Hayır"),
                                                    ),
                                                    const Spacer(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Row(
                                      children: [
                                        Text(
                                          "Hesabımı Sil!",
                                        ),
                                      ],
                                    )),
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
                            Column(
                              children: [
                                Container(
                                  color: Colors.red,
                                  width: 500,
                                  height: 100,
                                  child: const Column(
                                    children: [
                                      Text(
                                        "Reddedilen Talep Sayısı",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "data",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  color: Colors.amber,
                                  width: 500,
                                  height: 100,
                                  child: const Column(
                                    children: [
                                      Text(
                                        "Beklenen Talep Sayısı",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "data",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  color: Colors.green,
                                  width: 500,
                                  height: 100,
                                  child: const Column(
                                    children: [
                                      Text(
                                        "Onaylanan Talep Sayısı",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "data",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
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
                  );

                  var widget2 = Column(
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
                        height: 600,
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
                                    text: controller.firstname.value == null
                                        ? ""
                                        : controller.firstname.value!,
                                    function: (result) {
                                      controller.updateFirstName(
                                          profileUser, result);
                                    },
                                  ),
                                ),
                                Obx(
                                  () => EditingListTileWidget.custom1(
                                    title: "Soyad",
                                    text: controller.lastname.value == null
                                        ? ""
                                        : controller.lastname.value!,
                                    function: (result) {
                                      controller.updateLastName(
                                          profileUser, result);
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
                                      controller.updatetcno(
                                          profileUser, result);
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
                                      controller.updatemail(
                                          profileUser, result);
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
                                      controller.updatephone(
                                          profileUser, result);
                                    },
                                  ),
                                ),
                                Obx(
                                  () => DropdownButton<String>(
                                    value: controller.selectedGender.value,
                                    icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (String? newValue) {
                                      controller.selectedGender.value =
                                          newValue!;
                                    },
                                    items: <String>["Erkek", "Kadın"]
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
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
                                    text: controller.neighbourhood.value == null
                                        ? ""
                                        : controller.neighbourhood.value!,
                                    function: (result) {
                                      controller.updateneighbour(
                                          profileUser, result);
                                    },
                                  ),
                                ),
                                Obx(
                                  () => EditingListTileWidget.custom1(
                                    title: "Sokak-Cadde",
                                    text: controller.streetAvenue.value == null
                                        ? ""
                                        : controller.streetAvenue.value!,
                                    function: (result) {
                                      controller.updatestreetAvenue(
                                          profileUser, result);
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
                                      controller.updateoutDoor(
                                          profileUser, result);
                                    },
                                  ),
                                ),
                                Obx(
                                  () => EditingListTileWidget.custom1(
                                    title: "iç Kapı No",
                                    text: controller.insideDoor.value == null
                                        ? ""
                                        : controller.insideDoor.value!,
                                    function: (result) {
                                      controller.updateinsideDoor(
                                          profileUser, result);
                                    },
                                  ),
                                ),
                                Obx(
                                  () => EditingListTileWidget.custom1(
                                    title: "Adres Tarifi",
                                    text: controller
                                                .neighborhoodDirections.value ==
                                            null
                                        ? ""
                                        : controller
                                            .neighborhoodDirections.value!,
                                    function: (result) {
                                      controller.updateneighborhoodDirections(
                                          profileUser, result);
                                    },
                                  ),
                                ),

                                Obx(
                                  () => Column(
                                    children: List.generate(
                                      controller.alladress.length,
                                      (index) {
                                        AddresModel address =
                                            controller.alladress[index];
                                        return ListTile(
                                          leading: const Icon(
                                            Icons.home,
                                          ),
                                          title: Text(
                                            address.neighbourhood.toString(),
                                          ),
                                          subtitle: Text(
                                            address.description.toString(),
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  "Mevcut Adres",
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Get.dialog(
                                                    Dialog(
                                                      child: Container(
                                                        width: 350,
                                                        height: 150,
                                                        color: Colors.white,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: const Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "Mevcut Adresi Silmek İstediğinizden Emin misiniz?"),
                                                            Row(
                                                              children: [
                                                                Spacer(),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      null,
                                                                  child: Text(
                                                                      "Evet"),
                                                                ),
                                                                Spacer(),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      null,
                                                                  child: Text(
                                                                      "Hayır"),
                                                                ),
                                                                Spacer(),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: const Text(
                                                  "Mevcut Adresi Sil",
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                  return constraints.maxWidth < 500
                      ? Column(
                          children: [widget1, widget2],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [widget1, Expanded(child: widget2)],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
