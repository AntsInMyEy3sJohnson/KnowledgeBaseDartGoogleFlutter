import 'package:flutter/material.dart';

class SlidingPageRoute extends PageRouteBuilder {
  final Widget targetWidget;

  SlidingPageRoute({this.targetWidget})
      : super(
          pageBuilder: (context, _, __) => targetWidget,
          transitionsBuilder: (context, animation, _, child) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class ScalingPageRoute extends PageRouteBuilder {
  final Widget targetWidget;

  ScalingPageRoute({this.targetWidget})
      : super(
          pageBuilder: (context, _, __) => targetWidget,
          transitionsBuilder: (context, animation, _, child) => ScaleTransition(
            scale: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: child,
          ),
        );
}

class RotatingPageRoute extends PageRouteBuilder {
  final Widget targetWidget;

  RotatingPageRoute({this.targetWidget})
      : super(
          pageBuilder: (context, _, __) => targetWidget,
          transitionsBuilder: (context, animation, _, child) =>
              RotationTransition(
                  turns: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(animation),
                  child: child),
        );
}

class FadingPageRoute extends PageRouteBuilder {
  final Widget targetWidget;

  FadingPageRoute({this.targetWidget})
      : super(
          pageBuilder: (context, _, __) => targetWidget,
          transitionsBuilder: (context, animation, _, child) => FadeTransition(
              opacity: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(animation),
              child: child),
        );
}
