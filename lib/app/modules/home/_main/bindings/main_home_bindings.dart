import 'package:feedbackstation/app/modules/home/_main/views/main_home_view.dart';
import 'package:get/get.dart';

class MainHomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainHomeView>(() => const MainHomeView());
  }
}
