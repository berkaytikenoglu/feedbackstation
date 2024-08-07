import 'package:feedbackstation/app/modules/home/controllers/login_controller.dart';
import 'package:feedbackstation/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome to Home Screen!'),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const LoginView());
                },
                child: const Text("dsa")),
          ],
        ),
      ),
    );
  }
}
