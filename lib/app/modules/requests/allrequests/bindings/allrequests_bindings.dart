import 'package:feedbackstation/app/modules/requests/allrequests/controls/allrequests_controls.dart';
import 'package:get/get.dart';

class AllrequestspageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllrequestspageController());
  }
}
