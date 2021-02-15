import 'package:chapter_14_examples/hero_animations/starting_route.dart';
import 'package:chapter_14_examples/hero_animations/target_route.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case StartingRoute.ROUTE_NAME:
        return MaterialPageRoute(builder: (_) => const StartingRoute());
      case TargetRoute.ROUTE_NAME:
        return MaterialPageRoute(builder: (_) => const TargetRoute());
      default:
        throw RouteException("No such route: ${routeSettings.name}");
    }
  }

}

class RouteException implements Exception {
  final String message;

  RouteException(this.message);
}