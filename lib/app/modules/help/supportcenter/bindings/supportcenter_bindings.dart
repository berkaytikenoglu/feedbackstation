import 'package:feedbackstation/app/modules/help/supportcenter/views/supportcenter_views.dart';

import 'package:get/get.dart';

class SupportcenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportcenterView>(() => const SupportcenterView());
  }
}
