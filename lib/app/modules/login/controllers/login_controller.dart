import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Controller logic here

  var loginController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  var loginstatus = false.obs;

  @override
  void onInit() {
    super.onInit();
    loginController.value.text = "00000000000";
    passwordController.value.text = "12345678";
  }

  @override
  void onClose() {
    super.onClose();

    loginController.value.dispose();
    passwordController.value.dispose();
  }
}
