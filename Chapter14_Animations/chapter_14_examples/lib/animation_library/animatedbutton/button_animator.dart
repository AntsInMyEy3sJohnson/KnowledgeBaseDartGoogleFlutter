import 'package:chapter_14_examples/animation_library/animatedbutton/color_changing_button.dart';
import 'package:flutter/material.dart';

class ButtonAnimator extends StatefulWidget {

  const ButtonAnimator();

  @override
  State<StatefulWidget> createState() => _ButtonAnimatorState();
}

class _ButtonAnimatorState extends State<ButtonAnimator>
    with TickerProviderStateMixin {

  AnimationController _animationController;
  Animation<Color> _colorAnimation;

  @override
  Widget build(BuildContext context) {
    return ColorChangingButton(
      animationController: _animationController,
      colorAnimation: _colorAnimation,
    );
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    // More interesting Tweens:
    // * BorderRadiusTween
    // * IntTween
    // * DecorationTween
    // * ShapeBorderTween
    // * SizeTween
    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.blue
    ).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

}
