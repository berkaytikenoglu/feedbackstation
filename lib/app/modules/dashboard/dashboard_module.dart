import 'package:feedbackstation/app/modules/dashboard/_main/bindings/dashboard_bindings.dart';
import 'package:feedbackstation/app/modules/dashboard/_main/views/dashboard_view.dart';
import 'package:feedbackstation/app/modules/dashboard/detailing/bindings/admin_home_bindings.dart';
import 'package:feedbackstation/app/modules/dashboard/detailing/views/admin_home_view.dart';
import 'package:get/get.dart';

class DashboardModule {
  static const route = '/dashboard';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const AdminHomepageView(),
      binding: AdminHomepageBinding(),
    ),
    GetPage(
      name: "$route/users",
      page: () => const DashboardAdminView(),
      binding: DashboardAdminBinding(),
    ),
  ];
}
