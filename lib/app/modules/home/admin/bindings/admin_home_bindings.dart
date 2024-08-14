import 'package:feedbackstation/app/modules/home/admin/views/admin_home_view.dart';
import 'package:get/get.dart';

class AdminHomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminHomepageView>(() => const AdminHomepageView());
  }
}
