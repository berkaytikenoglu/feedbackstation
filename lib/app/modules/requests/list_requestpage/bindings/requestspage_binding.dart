import 'package:feedbackstation/app/modules/requests/list_requestpage/controllers/requestspage_controller.dart';
import 'package:get/get.dart';

class RequestspageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestspageController());
  }
}
