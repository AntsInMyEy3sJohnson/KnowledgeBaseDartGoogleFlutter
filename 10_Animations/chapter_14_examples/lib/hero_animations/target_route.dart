import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TargetRoute extends StatelessWidget {
  static const String ROUTE_NAME = "/target";

  const TargetRoute();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Hero(
            tag: 'FlutterLogo',
            child: SvgPicture.asset(
              "assets/coffee_mug.svg",
              width: 400,
              height: 400,
            )),
      ),
    );
  }
}
