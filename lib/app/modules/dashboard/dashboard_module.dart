import 'package:feedbackstation/app/modules/dashboard/admin/bindings/dashboard_bindings.dart';
import 'package:feedbackstation/app/modules/dashboard/admin/views/dashboard_view.dart';
import 'package:get/get.dart';

class DashboardModule {
  static const route = '/dashboard';

  static final List<GetPage> routes = [
    GetPage(
      name: "$route/user",
      page: () => const DashboardAdminView(),
      binding: DashboardAdminBinding(),
    ),
    GetPage(
      name: "$route/admin",
      page: () => const DashboardAdminView(),
      binding: DashboardAdminBinding(),
    ),
  ];
}
