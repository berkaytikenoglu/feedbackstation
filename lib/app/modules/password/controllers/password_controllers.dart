import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  var tcconttroller = TextEditingController().obs;
  var smsTextController = TextEditingController().obs;
  var telnoconttroller = TextEditingController().obs;
  var parolaconttroller = TextEditingController().obs;
  var parola2conttroller = TextEditingController().obs;
  var smscontroller = false.obs;
  var infocontroller = true.obs;
  var newpasswordcontroller = false.obs;
  var count = 60.obs;
  var timercolor = Colors.green;

  var kvkkcheck = false.obs;
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count <= 1) {
        timer.cancel();
        count.value = 0;
      }

      if (count <= 60 && count >= 45) {
        timercolor;
      } else if (count < 30) {
        timercolor = Colors.amber;
      } else if (count < 15) {
        timercolor = Colors.red;
      }
      count--;
    });
  }

  void resetTimer() {
    count.value = 60;
    timer.cancel();
    startTimer();
  }

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
