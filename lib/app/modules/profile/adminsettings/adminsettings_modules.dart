import 'package:feedbackstation/app/modules/profile/adminsettings/bindings/adminsetting_bindings.dart';
import 'package:feedbackstation/app/modules/profile/adminsettings/views/adminsettings_view.dart';
import 'package:get/get.dart';

class AdminsettingsModules {
  static const route = '/Adminsettings';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const AdminSettingsView(),
      binding: AdminsettingBindings(),
    ),
  ];
}
