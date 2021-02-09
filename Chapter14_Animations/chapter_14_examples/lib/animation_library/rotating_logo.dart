import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotatingLogo extends AnimatedWidget {
  static const _fullRotation = 2 * math.pi;

  final AnimationController _animationController;

  const RotatingLogo({AnimationController animationController})
      : _animationController = animationController,
        super(listenable: animationController);

  @override
  Widget build(BuildContext context) {
    // 'RotatingLogo' itself has a 'const' constructor, so it will be built
    // only once. What gets rebuilt with every frame, though (60 times per second
    // or even 120 times), is this 'Transform' widget.
    return Transform.rotate(
      // Flutter animations work with radians, so do conversion
      // The value of the animation controller is updated with every frame
      angle: _animationController.value * _fullRotation,
      // When working with animations, making use of 'const' constructors
      // as often as possible is even more vital because they tell Flutter not to
      // rebuilt the corresponding widgets with every new frame (which would result
      // in a very high rebuild rate as Flutter tries to maintain a refresh rate
      // of 120 frames per second!).
      // Problem: What if the given child widget itself contains a complex subtree
      // of many widgets, and what if many of them did not have a 'const' constructor?
      // --> All non-const widget in subtree would be rebuilt 60 or even 120 times
      // per second, which would be very inefficient and could slow down the app
      // --> Solution: AnimatedBuilder
      child: const FlutterLogo(
        size: 70,
      ),
    );
  }
}

// No need to extend AnimatedWidget here -- AnimatedBuilder below achieves the
// same thing
class RotatingLogoWithAnimatedBuilder extends StatelessWidget {
  final Animation _animation;

  const RotatingLogoWithAnimatedBuilder({Animation animation})
      : this._animation = animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value * 2 * math.pi,
          child: child,
        );
      },
      // Imagine super complex subtree of non-const widgets here
      child: FlutterLogo(
        size: 70,
      ),
    );
  }
}
