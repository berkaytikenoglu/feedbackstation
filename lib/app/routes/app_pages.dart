import 'package:feedbackstation/app/modules/home/home_module.dart';
import 'package:feedbackstation/app/modules/login/login_module.dart';
import 'package:feedbackstation/app/modules/user/user_module.dart';

class AppPages {
  static const initial = HomeModule.route;

  static final routes = [
    ...HomeModule.routes,
    ...LoginModule.routes,
    ...UserModule.routes, // Yeni eklenen modül rotaları
  ];
}
