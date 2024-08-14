import 'package:feedbackstation/app/modules/profile/settings/bindings/setttings_bindings.dart';
import 'package:feedbackstation/app/modules/profile/settings/views/settings_profile_view.dart';
import 'package:get/get.dart';

class ProfileModule {
  static const route = '/profile';

  static final List<GetPage> routes = [
    GetPage(
      name: "$route/settings",
      page: () => const SettingsProfileView(),
      binding: SetttingsBindings(),
    ),
  ];
}
