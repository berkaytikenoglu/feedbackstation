import 'dart:developer';

import 'package:feedbackstation/app/utils/applist.dart';
import 'package:get/get.dart';

class DashboardAdminController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    super.onInit();

    log(AppList.userList.length.toString());
  }

  @override
  void onClose() {
    //
    super.onClose();
  }
}
