import 'package:flutter/material.dart';

class SlidingAnimationRoute extends StatelessWidget {
  static const String ROUTE_NAME = "/slidingAnimationRoute";

  const SlidingAnimationRoute();

  @override
  Widget build(BuildContext context) => const CenteredFlutterLogo();

}

class ScalingAnimationRoute extends StatelessWidget {

  static const String ROUTE_NAME = "/scalingAnimationRoute";

  const ScalingAnimationRoute();

  @override
  Widget build(BuildContext context) => const CenteredFlutterLogo();

}

class RotatingAnimationRoute extends StatelessWidget {

  static const String ROUTE_NAME = "/rotatingAnimationRoute";

  const RotatingAnimationRoute();

  @override
  Widget build(BuildContext context) => const CenteredFlutterLogo();

}

class FadingAnimationRoute extends StatelessWidget {

  static const String ROUTE_NAME = "/fadingAnimationRoute";

  const FadingAnimationRoute();

  @override
  Widget build(BuildContext context) => const CenteredFlutterLogo();


}

class CenteredFlutterLogo extends StatelessWidget {

  const CenteredFlutterLogo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const FlutterLogo(
        size: 80,
      ),
    );
  }

}
