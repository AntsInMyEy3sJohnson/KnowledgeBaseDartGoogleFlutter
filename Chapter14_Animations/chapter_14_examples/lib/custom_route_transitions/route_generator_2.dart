import 'package:chapter_14_examples/custom_route_transitions/route_transitions.dart';
import 'package:chapter_14_examples/custom_route_transitions/starting_route_2.dart';
import 'package:chapter_14_examples/custom_route_transitions/target_routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator2 {
  RouteGenerator2._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case StartingRoute2.ROUTE_NAME:
        // Default transition for starting route
        return MaterialPageRoute(
            builder: (_) =>
                withScaffold(const StartingRoute2(), routeSettings.name));
      case SlidingAnimationRoute.ROUTE_NAME:
        // Sliding transition
        return SlidingPageRoute(
            targetWidget: withScaffold(
                const SlidingAnimationRoute(), routeSettings.name));
      case ScalingAnimationRoute.ROUTE_NAME:
        return ScalingPageRoute(
            targetWidget: withScaffold(
                const ScalingAnimationRoute(), routeSettings.name));
      case RotatingAnimationRoute.ROUTE_NAME:
        return RotatingPageRoute(
            targetWidget: withScaffold(
                const RotatingAnimationRoute(), routeSettings.name));
      case FadingAnimationRoute.ROUTE_NAME:
        return FadingPageRoute(
            targetWidget:
                withScaffold(const FadingAnimationRoute(), routeSettings.name));
      default:
        throw RouteException("No such route: ${routeSettings.name}");
    }
  }

  static Scaffold withScaffold(Widget route, String routeName) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Route: $routeName"),
        ),
        body: route);
  }
}

class RouteException implements Exception {
  final String message;

  RouteException(this.message);
}
