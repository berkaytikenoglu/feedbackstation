import 'package:feedbackstation/app/modules/profile/adminsettings/views/adminsettings_view.dart';
import 'package:get/get.dart';

class AdminsettingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSettingsView>(() => const AdminSettingsView());
  }
}
