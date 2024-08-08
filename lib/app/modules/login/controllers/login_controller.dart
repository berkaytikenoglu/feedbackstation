import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Controller logic here

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var selectedIndex = 0.obs;

  // Seçili butonu güncelleyen fonksiyon
  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    loginController.text = "00000000000";
    passwordController.text = "123";
  }

  @override
  void onClose() {
    super.onClose();

    loginController.dispose();
    passwordController.dispose();
  }
}
