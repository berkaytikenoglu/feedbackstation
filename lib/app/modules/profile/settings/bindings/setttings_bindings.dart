import 'package:feedbackstation/app/modules/profile/settings/views/settings_profile_view.dart';
import 'package:get/get.dart';

class SetttingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsProfileView>(() => const SettingsProfileView());
  }
}
