import 'package:feedbackstation/app/modules/register/bindings/register_bindings.dart';
import 'package:feedbackstation/app/modules/register/views/register_view.dart';
import 'package:get/get.dart';

class RegisterModule {
  static const route = '/register';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const RegisterpageView(),
      binding: RegisterBindings(),
    ),
  ];
}
