import 'package:chapter_14_examples/custom_route_transitions/target_route_2.dart';
import 'package:flutter/material.dart';

class StartingRoute2 extends StatelessWidget {

  static const String ROUTE_NAME = "/";

  const StartingRoute2();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: FlutterLogo(
          size: 40,
        ),
        onTap: () => Navigator.pushNamed(context, TargetRoute2.ROUTE_NAME),
      ),
    );
  }

}