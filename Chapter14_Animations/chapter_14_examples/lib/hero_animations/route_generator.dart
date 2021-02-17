import 'package:chapter_14_examples/hero_animations/starting_route.dart';
import 'package:chapter_14_examples/hero_animations/target_route.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case StartingRoute.ROUTE_NAME:
        return routeWithScaffold(const StartingRoute(), StartingRoute.ROUTE_NAME);
      case TargetRoute.ROUTE_NAME:
        return routeWithScaffold(const TargetRoute(), TargetRoute.ROUTE_NAME);
      default:
        throw RouteException("No such route: ${routeSettings.name}");
    }
  }

  static MaterialPageRoute<dynamic> routeWithScaffold(
      Widget route, String routeName) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Route: $routeName"),
        ),
        body: route,
      );
    });
  }
}

class RouteException implements Exception {
  final String message;

  RouteException(this.message);
}
