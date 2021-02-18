import 'package:flutter/material.dart';

class TargetRoute2 extends StatelessWidget {
  static const String ROUTE_NAME = "/target";

  const TargetRoute2();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlutterLogo(
        size: 80,
      ),
    );
  }
}
