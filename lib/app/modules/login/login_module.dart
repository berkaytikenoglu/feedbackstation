import 'package:feedbackstation/app/modules/login/bindings/login_binding.dart';
import 'package:feedbackstation/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';

class LoginModule {
  static const route = '/login';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
