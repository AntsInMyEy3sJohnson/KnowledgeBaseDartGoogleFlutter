import 'package:flutter/material.dart';

class MovingButton extends StatefulWidget {
  const MovingButton();

  @override
  State<StatefulWidget> createState() => _MovingButton();
}

class _MovingButton extends State<MovingButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final scale = 1 - (_animationController.value * 0.5);
          final newPosition = 20 + (_animationController.value * 100);

          // Make use of stack so moving widgets don't cause other widgets
          // to change their positions, too --> Stack is set of overlapped and
          // independent levels
          return Stack(
            children: [
              Transform(
              // Use identity matrix as starting point
                transform: Matrix4.identity()
                  // ..scale(scale)
                  ..translate(newPosition, newPosition),
                child: child,
              ),
              const Text("Hello")
            ],
          );
        },
        child: RaisedButton(
          child: const Text("Move me"),
          onPressed: _onPressed,
        ));
  }

  void _onPressed() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
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
