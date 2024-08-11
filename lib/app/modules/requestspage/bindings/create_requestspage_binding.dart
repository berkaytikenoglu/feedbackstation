import 'package:feedbackstation/app/modules/requestspage/controllers/create_requestspage_controller.dart';
import 'package:get/get.dart';

class CreateRequestspageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateRequestspageController());
  }
}
