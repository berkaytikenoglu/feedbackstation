import 'package:feedbackstation/app/modules/requests/detail_requestpage/controllers/detail_requestspage_controller.dart';
import 'package:get/get.dart';

class DetailRequestspageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailRequestspageController());
  }
}
