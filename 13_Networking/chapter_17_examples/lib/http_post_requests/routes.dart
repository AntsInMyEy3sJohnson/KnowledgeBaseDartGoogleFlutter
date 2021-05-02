import 'package:chapter_17_examples/http_post_requests/routes/post_request_page.dart';
import 'package:chapter_17_examples/http_post_requests/routes/result_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case PostRequestPage.ROUTE_ID:
        return MaterialPageRoute(builder: (_) => _WithScaffold(PostRequestPage()));
      case ResultPage.ROUTE_ID:
        return MaterialPageRoute(builder: (_) => _WithScaffold(ResultPage(routeSettings.arguments)));
      default:
        throw RouteException("No such route: ${routeSettings.name}");
    }
  }

}

class _WithScaffold extends StatelessWidget {

  final Widget _widget;

  _WithScaffold(this._widget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widget,
      ),
    );
  }

}

class RouteException implements Exception {
  final String message;

  RouteException(this.message);
}