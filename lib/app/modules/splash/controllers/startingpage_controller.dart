import 'dart:developer';

import 'package:get/get.dart';

class StartingpageController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    log("Açılış Ekranı Hoşgeldiniz");
  }

  @override
  void onClose() {
    super.onClose();
    log("Açılış Ekranından gidiyorsunuz");
  }
}
