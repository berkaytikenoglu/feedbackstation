import 'package:feedbackstation/app/modules/startingpage/controllers/startingpage_controller.dart';
import 'package:get/get.dart';

class StartingpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartingpageController>(() => StartingpageController());
  }
}
