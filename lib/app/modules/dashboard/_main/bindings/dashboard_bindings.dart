import 'package:feedbackstation/app/modules/dashboard/_main/views/dashboard_view.dart';
import 'package:get/get.dart';

class DashboardAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardAdminView>(() => const DashboardAdminView());
  }
}
