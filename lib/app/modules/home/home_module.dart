import 'package:feedbackstation/app/modules/home/_main/bindings/main_home_bindings.dart';
import 'package:feedbackstation/app/modules/home/_main/views/main_home_view.dart';
import 'package:get/get.dart';

class HomepageModule {
  static const route = '/home';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const MainHomeView(),
      binding: MainHomeBindings(),
    ),
  ];
}
