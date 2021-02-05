import 'package:chapter_12_examples/sharing_data_with_provider/routes/todo_detail_view_2.dart';
import 'package:chapter_12_examples/sharing_data_with_provider/routes/todo_overview_2.dart';
import 'package:flutter/material.dart';

class RouteGenerator3 {
  RouteGenerator3._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TodoOverview2.ROUTE_IDENTIFIER:
        return MaterialPageRoute(builder: (_) => const TodoOverview2());
      case TodoDetailView2.ROUTE_IDENTIFIER:
        return MaterialPageRoute(builder: (_) => const TodoDetailView2());
      default:
        throw RouteException("No such route: ${routeSettings.name}");
    }
  }

}

class RouteException implements Exception {
  final String message;

  RouteException(this.message);
}
