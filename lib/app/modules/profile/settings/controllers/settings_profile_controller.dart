import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabbarController;
  @override
  void onInit() {
    super.onInit();

    tabbarController = TabController(length: 4, vsync: this);
  }

  @override
  void onClose() {
    super.onClose();
    tabbarController.dispose();
  }
}
