import 'package:feedbackstation/app/modules/splash/bindings/startingpage_binding.dart';
import 'package:feedbackstation/app/modules/splash/views/startingpage_view.dart';
import 'package:get/get.dart';

class StartingpageModule {
  static const route = '/splash';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const StartingpageView(),
      binding: StartingpageBinding(),
    ),
  ];
}
