import 'package:feedbackstation/app/modules/profile/adminsettings/controllers/adminsettings_controller.dart';
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

    // final MainHomeController controller = Get.put(MainHomeController());

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
                Text("Registiration Settings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
            const Row(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text("Allow New registirations",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: null,
                        ),
                        SizedBox(height: 20),
                        Text("dsada"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: null,
                        ),
                        SizedBox(height: 20),
                        Text("dsada"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: null,
                        ),
                        SizedBox(height: 20),
                        Text("dsada"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: null,
                        ),
                        SizedBox(height: 20),
                        Text("dsada"),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
