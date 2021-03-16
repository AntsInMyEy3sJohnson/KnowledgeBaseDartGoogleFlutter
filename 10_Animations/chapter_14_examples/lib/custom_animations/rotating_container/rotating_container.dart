import 'dart:math' as math;

import 'package:flutter/material.dart';

class RotatingContainer extends StatefulWidget {
  const RotatingContainer();

  @override
  State<StatefulWidget> createState() => _RotatingContainerState();
}

class _RotatingContainerState extends State<RotatingContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.skewY(0) // "Biegung"
                ..rotateY(_animationController.value * 2 * math.pi)
                ..rotateX(_animationController.value * 2 * math.pi),
              child: child,
            );
          },
          child: Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(child: const Text("I'm rotating!")),
          ),
        ),
        Spacer(flex: 1),
        RaisedButton(
          onPressed: _startRotation,
          child: const Text("Start Rotation"),
        ),
        Spacer(flex: 2),
      ],
    );
  }

  void _startRotation() {
    _animationController.repeat();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
