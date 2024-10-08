import 'package:feedbackstation/app/modules/requests/_main/controllers/main_requestpage_controller.dart';
import 'package:feedbackstation/app/modules/requests/create_requestpage/controllers/create_requestspage_controller.dart';
import 'package:get/get.dart';

class CreateRequestspageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateRequestspageController());

    Get.lazyPut<MainRequestController>(() => MainRequestController());
  }
}
