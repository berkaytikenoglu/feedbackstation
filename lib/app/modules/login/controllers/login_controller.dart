import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Controller logic here

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var loginstatus = false.obs;

  @override
  void onInit() {
    super.onInit();
    loginController.text = "00000000000";
    passwordController.text = "12345678";
  }

  @override
  void onClose() {
    super.onClose();

    loginController.dispose();
    passwordController.dispose();
  }
}
