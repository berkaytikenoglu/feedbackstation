import 'package:feedbackstation/app/modules/password/controllers/password_controllers.dart';

import 'package:get/get.dart';

class PasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordController>(() => PasswordController());
  }
}
