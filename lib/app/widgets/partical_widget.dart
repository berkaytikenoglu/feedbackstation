import 'dart:math';

import 'package:flutter/material.dart';
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:particles_flutter/particles_engine.dart';

class ParticalWidget {
  //Functions
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

  static Particles particals(
    context, {
    required Function particals,
  }) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Particles(
      awayRadius: 100,
      particles: particals(),
      height: screenHeight,
      width: screenWidth,
      onTapAnimation: true,
      awayAnimationDuration: const Duration(milliseconds: 10000),
      awayAnimationCurve: Curves.easeInBack,
      enableHover: true,
      hoverRadius: 80,
      connectDots: true,
    );
  }
}
