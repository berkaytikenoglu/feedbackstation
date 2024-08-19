import 'dart:developer';

import 'package:get/get.dart';

class MainRequestController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    log("Anasayfaya Hoşgeldiniz");
  }

  @override
  void onClose() {
    super.onClose();

    log("Anasayfaya Çıkıtnız");
  }
}
