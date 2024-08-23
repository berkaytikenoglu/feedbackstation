import 'package:feedbackstation/app/modules/profile/adminsettings/controllers/adminsettings_controller.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_controller.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';
import 'package:feedbackstation/app/widgets/drawer/drawer_controller.dart';

import 'package:feedbackstation/app/widgets/textfields_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSettingsView extends StatelessWidget {
  const AdminSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppBarWidgetController());
    Get.put(DrawerWidgetController());
    final controller = Get.put(AdminsettingsController());

    return Scaffold(
      appBar: const AppbarWidget(title: "Hizmet Yönetim Paneli"),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Hizmet Yönetimi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Hizmet Yönetimi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const Row(
              children: [
                Text("Opertional Settings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                const Text(
                  "Network Title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  height: 100,
                  width: 500,
                  child: TextfieldWidget.costum2(
                    controller: controller.textController.value,
                    label: "TC Kimlik",
                    icon: Icons.person,
                    isDigitalNumber: true,
                    maxLength: 11,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                const Text(
                  "Network Admin Mail",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  height: 100,
                  width: 500,
                  child: TextfieldWidget.costum2(
                    controller: controller.textController.value,
                    label: "TC Kimlik",
                    icon: Icons.person,
                    isDigitalNumber: true,
                    maxLength: 11,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Text("Kategoriler",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text("Kategoriler",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    ...List.generate(AppList.requestcategoriesList.length,
                        (index) {
                      return Row(
                        children: [
                          const Checkbox(
                            value: true,
                            onChanged: null,
                          ),
                          const SizedBox(height: 20),
                          Text(
                              "${AppList.requestcategoriesList[index].name} Durumu"),
                        ],
                      );
                    }),
                  ],
                ),
              ],
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(color: Colors.black12),
              children: [
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Ünvan"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Kategorisi"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Admin Panelini Görebilir",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Kullanıcı bilgilerini Değiştirebilir"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Kullanıcı Silebilir"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Text("Kullanıcı Profil Fotoğrafını Değiştirebilir "),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Taleplere Cevap Verebilir "),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Hangi Taleplere Cevap Verebilir "),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(" Talep Ekleyebilir "),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Talep Silebilir "),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Talepte Bulunabilir "),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Kendi Profilini Değiştirebilir "),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Kendi Profilini Silebilir "),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Kendi Profil Fotoğrafını Değiştirebilir "),
                    ),
                  ],
                ),
                ...List.generate(
                  AppList.permissionsList.length,
                  (index) {
                    return TableRow(
                      children: [
                        Text(AppList.permissionsList[index].name),
                        Text(AppList.permissionsList[index].category),
                        Checkbox(
                          value:
                              AppList.permissionsList[index].canShowAdminPanel,
                          onChanged: (value) {},
                        ),
                        Checkbox(
                          value: AppList.permissionsList[index].canEditUser,
                          onChanged: (value) {},
                        ),
                        Checkbox(
                          value: AppList.permissionsList[index].canDeleteUser,
                          onChanged: (value) {},
                        ),
                        Checkbox(
                          value: AppList
                              .permissionsList[index].canUploaduserAvatar,
                          onChanged: (value) {},
                        ),
                        Checkbox(
                          value:
                              AppList.permissionsList[index].canResponseRequest,
                          onChanged: (value) {},
                        ),
                        IconButton(
                          color: Colors.grey,

                          icon: Icon(
                            Icons.list,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            Get.dialog(
                              Dialog(
                                child: Container(
                                  width: 300,
                                  height: 430,
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Yetkiler",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 24,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      ...List.generate(
                                        AppList.requestcategoriesList.length,
                                        (index2) {
                                          bool checkboxValue = AppList
                                                  .permissionsList[index]
                                                  .canResponseRequestlist![
                                              AppList
                                                  .requestcategoriesList[index2]
                                                  .id
                                                  .toString()];

                                          return Row(
                                            children: [
                                              Checkbox(
                                                value: checkboxValue,
                                                onChanged: (bool? value) {
                                                  if (value != null) {
                                                    checkboxValue = value;
                                                  }
                                                },
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                AppList
                                                    .requestcategoriesList[
                                                        index2]
                                                    .name,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      const ElevatedButton(
                                          onPressed: null,
                                          child: Text("Kaydet"))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          // child: const Text("data"),
                        ),
                        Checkbox(
                          value: AppList
                              .permissionsList[index].canAddFeedbackCategory,
                          onChanged: (value) {},
                        ),
                        Checkbox(
                          value: AppList
                              .permissionsList[index].canDeleteFeedbackCategory,
                          onChanged: (value) {},
                        ),
                        Checkbox(
                          value:
                              AppList.permissionsList[index].canReportRequest,
                          onChanged: (value) {},
                        ),
                        Checkbox(
                          value:
                              AppList.permissionsList[index].canEditmyProfile,
                          onChanged: (value) {},
                        ),
                        Checkbox(
                          value:
                              AppList.permissionsList[index].canDeletemyProfile,
                          onChanged: (value) {},
                        ),
                        Checkbox(
                          value: AppList
                              .permissionsList[index].canUploadAvatarmyProfile,
                          onChanged: (value) {},
                        ),
                      ],
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
