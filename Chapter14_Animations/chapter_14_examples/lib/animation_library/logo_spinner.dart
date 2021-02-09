import 'package:chapter_14_examples/animation_library/rotating_logo.dart';
import 'package:flutter/material.dart';

class LogoSpinner extends StatefulWidget {
  const LogoSpinner();

  @override
  State<StatefulWidget> createState() => _LogoSpinnerState();
}

// We need a StatefulWidget here due to the need to dispose of
// the AnimationController when not required anymore in order not
// to make the animation waste any resources
class _LogoSpinnerState extends State<LogoSpinner>
    with TickerProviderStateMixin {
  // AnimationControllers continuously generate a series of values for the
  // configured duration whenever the device is ready for a new frame
  // Default: Produce values from 0.0 to 1.0 for the entire duration
  // Normally, an AnimationController will generate 60 new values per second,
  // but that depends on the refresh rate of the device.
  // Caution: Be wary of multiple animations running even when they are not
  // visible -- performance drop ahead
  AnimationController _animationController;
  CurvedAnimation _curvedAnimation;

  @override
  Widget build(BuildContext context) {
    // return RotatingLogoWithAnimatedBuilder(
    //     animationController: _animationController);
    return RotatingLogoWithAnimatedBuilder(animation: _curvedAnimation);
  }

  // Always make sure to properly initialize and dispose when not needed anymore!
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      // 'vsync' prevents off-screen AnimationControllers from unnecessarily
      // consuming resources. Initialize with 'this' to provide AnimationController
      // with possibility to automatically handle animation resources. To make
      // a StatefulWidget ('this') assignable to the 'vsync' parameter, use
      // the 'TickerProviderStateMixin', which makes the StatefulWidget an
      // instance of 'TickerProvider'.
      vsync: this,
    )..repeat(); // Tells the AnimationController to repeat the animation
    // indefinitely. Given the above configuration, the AnimationController
    // will produce an infinite chain of animations (where each animation is
    // expressed by means of a series of values from 0.0 to 1.0), each lasting
    // 3 seconds.
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
