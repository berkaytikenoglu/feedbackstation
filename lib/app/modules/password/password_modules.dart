import 'package:feedbackstation/app/modules/password/bindings/password_bindigs.dart';
import 'package:feedbackstation/app/modules/password/views/passsword_view.dart';

import 'package:get/get.dart';

class PasswordModule {
  static const route = '/Password';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const PasswordpageView(),
      binding: PasswordBindings(),
    ),
  ];
}
