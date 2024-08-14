import 'dart:developer';

import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/data/providers/user_provider.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:get/get.dart';

class StartingpageController extends GetxController {
  Future<void> fetchUserRandom() async {
    log("Rastgele Üyeler Çekiliyor...");

    for (var i = 0; i < 10; i++) {
      List<User> aa = await UserProvider().fetchRandomUsers();
      for (User element in aa) {
        AppList.userList.add(element);
      }
    }
    log("Rastgele Üyeler Getirildi.");
  }

  @override
  void onInit() {
    super.onInit();

    log("Açılış Ekranı Hoşgeldiniz");
    fetchUserRandom();
  }

  @override
  void onClose() {
    super.onClose();
    log("Açılış Ekranından gidiyorsunuz");
  }
}
