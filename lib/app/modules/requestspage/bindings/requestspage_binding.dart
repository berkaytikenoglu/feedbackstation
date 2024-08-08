import 'package:feedbackstation/app/modules/requestspage/controllers/requestspage_controller.dart';
import 'package:get/get.dart';

class RequestspageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestspageController>(() => RequestspageController());
  }
}
