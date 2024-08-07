import 'package:get/get.dart';
import 'bindings/user_binding.dart';
import 'views/user_view.dart';

class UserModule {
  static const route = '/users';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
  ];
}
