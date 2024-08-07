import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/modules/startingpage/controllers/startingpage_controller.dart';
import 'package:feedbackstation/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartingpageView extends GetView<StartingpageController> {
  const StartingpageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3C4CBD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppInfo.appImage,
              scale: 3,
            ),
            Text(
              "${AppInfo.appName} Hoşgeldiniz...",
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(() => const LoginView());
              },
              child: const Text(
                "Giriş ekranı",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
