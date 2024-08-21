import 'package:feedbackstation/app/widgets/appbar/appbar_controller.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';

import 'package:feedbackstation/app/widgets/drawer/drawer_controller.dart';
import 'package:feedbackstation/app/widgets/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSettingsView extends StatelessWidget {
  const AdminSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppBarWidgetController());
    Get.put(DrawerWidgetController());

    // final MainHomeController controller = Get.put(MainHomeController());

    return const Scaffold(
      appBar: AppbarWidget(title: "Kullanıcı Paneli"),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("data"),
          ],
        ),
      ),
    );
  }
}
