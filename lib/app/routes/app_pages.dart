import 'package:feedbackstation/app/modules/homepage/homepage_module.dart';
import 'package:feedbackstation/app/modules/requestspages/requestpage/requestspage_module.dart';
import 'package:feedbackstation/app/modules/startingpage/startingpage_module.dart';
import 'package:feedbackstation/app/modules/login/login_module.dart';
import 'package:feedbackstation/app/modules/user/user_module.dart';

class AppPages {
  static const initial = StartingpageModule.route;

  static final routes = [
    ...StartingpageModule.routes,
    ...LoginModule.routes,
    ...UserModule.routes,
    ...HomepageModule.routes,
    ...RequestspageModule.routes,
  ];
}
