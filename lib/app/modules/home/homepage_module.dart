import 'package:feedbackstation/app/modules/home/admin/bindings/admin_home_bindings.dart';
import 'package:feedbackstation/app/modules/home/admin/views/admin_home_view.dart';
import 'package:get/get.dart';
import 'user/bindings/homepage_binding.dart';
import 'user/views/homepage_view.dart';

class HomepageModule {
  static const route = '/home';

  static final List<GetPage> routes = [
    GetPage(
      name: "$route/user",
      page: () => const UserHomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: "$route/admin",
      page: () => const AdminHomepageView(),
      binding: AdminHomepageBinding(),
    ),
  ];
}
