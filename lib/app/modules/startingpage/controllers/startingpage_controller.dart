import 'package:get/get.dart';
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:feedbackstation/app/widgets/partical_widget.dart';

class StartingpageController extends GetxController {
  var particles = <Particle>[].obs;

  @override
  void onInit() {
    super.onInit();
    particles.value = ParticalWidget.createParticles();
  }
}
