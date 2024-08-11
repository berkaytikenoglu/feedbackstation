import 'package:feedbackstation/app/appinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartingpageView extends StatelessWidget {
  const StartingpageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 45, 80),
      body: Center(
        child: Center(
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
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 22,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed("/login");
                },
                child: const Text(
                  "Giriş ekranı",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
