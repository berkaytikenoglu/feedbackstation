import 'package:feedbackstation/app/data/providers/user_provider.dart';
import 'package:feedbackstation/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';
import '../controllers/homepage_controller.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProvider>(() => UserProvider());
    Get.lazyPut<UserRepository>(() => UserRepository(userProvider: Get.find()));
    Get.lazyPut<HomepageController>(() => HomepageController(
          homepageRepository: Get.find(),
        ));
  }
}
