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
