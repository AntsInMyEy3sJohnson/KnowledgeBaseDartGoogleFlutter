import 'dart:math' as math;

import 'package:flutter/material.dart';

class RotatingLogo extends AnimatedWidget {

  static const _fullRotation = 2 * math.pi;

  final AnimationController _animationController;

  const RotatingLogo({AnimationController animationController})
      : _animationController = animationController,
        super(listenable: animationController);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      // Flutter animations work with radians, so do conversion
      // The value of the animation controller is updated with every frame
      angle: _animationController.value * _fullRotation,
      // When working with animations, making use of 'const' constructors
      // as often as possible is even more vital because they tell Flutter not to
      // rebuilt the corresponding widgets with every new frame (which would result
      // in a very high rebuild rate as Flutter tries to maintain a refresh rate
      // of 120 frames per second!).
      child: const FlutterLogo(
        size: 70,
      ),
    );
  }
}
