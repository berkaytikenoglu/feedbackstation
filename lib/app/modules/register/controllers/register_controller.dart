import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var tcconttroller = TextEditingController().obs;
  var adconttroller = TextEditingController().obs;
  var soyAdconttroller = TextEditingController().obs;
  var telnoconttroller = TextEditingController().obs;
  var parolaconttroller = TextEditingController().obs;
  var parola2conttroller = TextEditingController().obs;
  var mailconttroller = TextEditingController().obs;

  var kvkkcheck = false.obs;

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
