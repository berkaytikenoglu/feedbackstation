import 'package:feedbackstation/app/modules/requests/_main/controllers/main_requestpage_controller.dart';
import 'package:get/get.dart';

class MainRequestspageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainRequestController>(() => MainRequestController());
  }
}
