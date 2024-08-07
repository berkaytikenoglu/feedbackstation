import 'package:get/get.dart';
import 'bindings/homepage_binding.dart';
import 'views/homepage_view.dart';

class HomepageModule {
  static const route = '/users';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const HomepageView(),
      binding: HomepageBinding(),
    ),
  ];
}
