import 'package:feedbackstation/app/appinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppInfo.appName,
      theme: appThemeData,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
