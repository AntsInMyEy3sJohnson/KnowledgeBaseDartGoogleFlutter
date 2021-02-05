import 'package:chapter_12_examples/sharing_data_with_navigator/routes/todo_detail_view.dart';
import 'package:chapter_12_examples/sharing_data_with_navigator/routes/todo_overview.dart';
import 'package:flutter/material.dart';

class RouteGenerator2 {
  RouteGenerator2._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TodoOverview.ROUTE_IDENTIFIER:
        return MaterialPageRoute(builder: (_) => TodoOverview());
      case TodoDetailView.ROUTE_IDENTIFIER:
        return MaterialPageRoute(builder: (_) => TodoDetailView(routeSettings.arguments));
      default:
        throw RouteException("No such route: ${routeSettings.name}");
    }
  }
}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
