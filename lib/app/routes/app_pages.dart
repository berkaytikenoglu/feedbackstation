import 'package:feedbackstation/app/modules/dashboard/dashboard_module.dart';
import 'package:feedbackstation/app/modules/home/homepage_module.dart';
import 'package:feedbackstation/app/modules/password/password_modules.dart';
import 'package:feedbackstation/app/modules/profile/profile_module.dart';
import 'package:feedbackstation/app/modules/register/register_module.dart';
import 'package:feedbackstation/app/modules/requests/requestspage_module.dart';
import 'package:feedbackstation/app/modules/splash/startingpage_module.dart';
import 'package:feedbackstation/app/modules/login/login_module.dart';

class AppPages {
  static const initial = StartingpageModule.route;

  static final routes = [
    ...StartingpageModule.routes,
    ...LoginModule.routes,
    ...HomepageModule.routes,
    ...RequestspageModule.routes,
    ...ProfileModule.routes,
    ...DashboardModule.routes,
    ...RegisterModule.routes,
    ...PasswordModule.routes,
  ];
}
