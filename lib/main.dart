import 'package:feedbackstation/app/data/providers/user_provider.dart';
import 'package:feedbackstation/app/data/repositories/user_repository.dart';
import 'package:feedbackstation/app/modules/requestspage/controllers/create_requestspage_controller.dart';
import 'package:feedbackstation/app/modules/startingpage/controllers/startingpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app.dart';
import 'app/modules/user/controllers/user_controller.dart';

void main() {
  Get.put(UserController(
    userRepository: UserRepository(userProvider: UserProvider()),
  ));

  Get.put(StartingpageController());

  Get.put(CreateRequestspageController());

  runApp(const App());
}
