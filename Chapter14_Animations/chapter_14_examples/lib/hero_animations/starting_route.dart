import 'package:chapter_14_examples/hero_animations/target_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartingRoute extends StatelessWidget {
  static const String ROUTE_NAME = "/";

  const StartingRoute();

  @override
  Widget build(BuildContext context) {
    // The Hero widget itself does not have an 'onTap' callback,
    // so wrap within GestureDetector
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(TargetRoute.ROUTE_NAME),
      child: Container(
        child: Hero(
          tag: 'FlutterLogo',
          child: SvgPicture.asset("assets/flutter_logo.svg"),
        ),
      ),
    );
  }
}
