import 'package:chapter_12_examples/routes.dart';
import 'package:chapter_12_examples/routes/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The MaterialApp can be wrapped in a MultiProvider (or a MultiBlocProvider)
    // if multiple routes need to synchronize and share state
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.grey
      ),
      onGenerateTitle: (context) => "Cool Content App",
      initialRoute: HomePage.ROUTE_IDENTIFIER,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
