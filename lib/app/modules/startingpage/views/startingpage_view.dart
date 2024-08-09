import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/modules/startingpage/controllers/startingpage_controller.dart';
import 'package:feedbackstation/app/modules/login/views/login_view.dart';
import 'package:feedbackstation/app/widgets/partical_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartingpageView extends GetView<StartingpageController> {
  const StartingpageView({super.key});

  @override
  Widget build(BuildContext context) {
    final StartingpageController controller = Get.put(StartingpageController());

    return Stack(
      children: [
        ParticalWidget.particals(
          context,
          particals: controller.particles.call,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppInfo.appImage,
                scale: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppInfo.appName,
                  style: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const LoginView());
                },
                child: const Text(
                  "Giriş ekranı",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
