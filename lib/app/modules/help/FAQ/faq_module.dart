import 'package:feedbackstation/app/modules/help/FAQ/bindings/faq_bindings.dart';
import 'package:feedbackstation/app/modules/help/FAQ/views/faq_views.dart';

import 'package:get/get.dart';

class FAQpageModule {
  static const route = '/FAQ';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const FAQView(),
      binding: FaqBindings(),
    ),
  ];
}
