import 'package:feedbackstation/app/modules/help/FAQ/views/faq_views.dart';

import 'package:get/get.dart';

class FaqBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FAQView>(() => const FAQView());
  }
}
