import 'package:feedbackstation/app/modules/startingpage/bindings/startingpage_binding.dart';
import 'package:feedbackstation/app/modules/startingpage/views/startingpage_view.dart';
import 'package:get/get.dart';

class StartingpageModule {
  static const route = '/home';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const StartingpageView(),
      binding: StartingpageBinding(),
    ),
  ];
}
