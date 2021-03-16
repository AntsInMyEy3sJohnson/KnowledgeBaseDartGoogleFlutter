import 'package:chapter_14_examples/custom_route_transitions/target_routes.dart';
import 'package:flutter/material.dart';

class StartingRoute2 extends StatelessWidget {
  static const String ROUTE_NAME = "/";

  const StartingRoute2();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RaisedButton(
            onPressed: () =>
                Navigator.pushNamed(context, SlidingAnimationRoute.ROUTE_NAME),
            child: const Text("Sliding Transition"),
          ),
          RaisedButton(
            onPressed: () =>
                Navigator.pushNamed(context, ScalingAnimationRoute.ROUTE_NAME),
            child: const Text("Scaling Transition"),
          ),
          RaisedButton(
            onPressed: () =>
                Navigator.pushNamed(context, RotatingAnimationRoute.ROUTE_NAME),
            child: const Text("Rotating Transition"),
          ),
          RaisedButton(
            onPressed: () =>
                Navigator.pushNamed(context, FadingAnimationRoute.ROUTE_NAME),
            child: const Text("Fading Transition"),
          )
        ],
      ),
    );
  }
}
