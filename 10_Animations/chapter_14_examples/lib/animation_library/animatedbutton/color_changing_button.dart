import 'package:flutter/material.dart';

class ColorChangingButton extends StatelessWidget {
  final AnimationController _animationController;
  final Animation<Color> _colorAnimation;

  const ColorChangingButton(
      {AnimationController animationController,
      Animation<Color> colorAnimation})
      : this._animationController = animationController,
        this._colorAnimation = colorAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return RaisedButton(
          child: child,
          color: _colorAnimation.value,
          onPressed: _buttonTapped,
        );
      },
      child: const Text("Change Button Color"),
    );
  }

  void _buttonTapped() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }
}
