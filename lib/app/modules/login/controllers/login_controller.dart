import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Controller logic here

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    // Controller kapanırken temizlemek için
    loginController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
