import 'package:feedbackstation/app/data/providers/user_provider.dart';
import 'package:feedbackstation/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProvider>(() => UserProvider());
    Get.lazyPut<UserRepository>(() => UserRepository(userProvider: Get.find()));
    Get.lazyPut<UserController>(
        () => UserController(userRepository: Get.find()));
  }
}
