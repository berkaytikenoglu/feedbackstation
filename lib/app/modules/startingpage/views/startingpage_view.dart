import 'dart:math';

import 'package:feedbackstation/app/appinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:particles_flutter/particles_engine.dart';

class StartingpageView extends StatelessWidget {
  const StartingpageView({super.key});
  static List<Particle> createParticles() {
    var rng = Random();
    List<Particle> particles = [];
    for (int i = 0; i < 140; i++) {
      particles.add(Particle(
        color: Colors.white.withOpacity(0.05),
        size: rng.nextDouble() * 1,
        velocity: Offset(rng.nextDouble() * 22 * randomSign(),
            rng.nextDouble() * 22 * randomSign()),
      ));
    }
    return particles;
  }

  static double randomSign() {
    var rng = Random();
    return rng.nextBool() ? 1 : -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: const Color.fromARGB(255, 2, 45, 80),
            child: Particles(
              awayRadius: 100,
              particles: createParticles(),
              height: Get.height,
              width: Get.width,
              onTapAnimation: true,
              awayAnimationDuration: const Duration(milliseconds: 10000),
              awayAnimationCurve: Curves.easeInBack,
              enableHover: true,
              hoverRadius: 80,
              connectDots: true,
            ),
          ),
          Center(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppInfo.appImage,
                    scale: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppInfo.appName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get.toNamed("/login");
                      // Get.offNamed("/login");
                      Get.offAndToNamed("/login");
                    },
                    child: const Text(
                      "Giriş ekranı",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
