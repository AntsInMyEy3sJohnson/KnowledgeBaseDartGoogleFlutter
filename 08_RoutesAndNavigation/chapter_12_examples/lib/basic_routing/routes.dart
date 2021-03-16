
import 'package:chapter_12_examples/basic_routing/routes/home_page.dart';
import 'package:chapter_12_examples/basic_routing/routes/kitten_page.dart';
import 'package:flutter/material.dart';

/// Central place for generating and managing routes. Its main job is to map
/// route URIs to widgets so the Navigator class can create those routes.
///
/// Keeping this logic in one central place is a nice way to adhere to the SRP.
class RouteGenerator {

  RouteGenerator._();
  
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    
    switch(routeSettings.name) {
      case HomePage.ROUTE_IDENTIFIER:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case KittenPage.ROUTE_IDENTIFIER:
        return MaterialPageRoute(builder: (_) => const KittenPage());
      default:
        throw RouteException("No such route: ${routeSettings.name}");
    }
    
  }

}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}