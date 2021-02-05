import 'package:chapter_12_examples/basic_routing/routes.dart';
import 'package:chapter_12_examples/basic_routing/routes/home_page.dart';
import 'package:chapter_12_examples/sharing_data_with_navigator/routes.dart';
import 'package:chapter_12_examples/sharing_data_with_navigator/routes/todo_overview.dart';
import 'package:chapter_12_examples/sharing_data_with_provider/data/todo_item_cache.dart';
import 'package:chapter_12_examples/sharing_data_with_provider/routes.dart';
import 'package:chapter_12_examples/sharing_data_with_provider/routes/todo_overview_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The MaterialApp can be wrapped in a MultiProvider (or a MultiBlocProvider)
    // if multiple routes need to synchronize and share state

    // return RoutingBasicsMaterialApp();
    // return SharingDataWithNavigatorMaterialApp();
    return SharingDataWithProviderMaterialApp();
  }
}

/// Best solution for sharing data between routes:
/// * Routing logic is implemented in its own class
/// * Business logic and state is encapsulated in its own class, too (here: 'TodoItemCache')
/// --> UI not intermingled with routing and business logic, hence very loose coupling
///  between components
///  --> Much more desirable than passing data using 'push()' and 'pop()'
class SharingDataWithProviderMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<TodoItemCache>(
      create: (_) => TodoItemCache(),
      child: MaterialApp(
        theme: Theme.of(context).copyWith(primaryColor: Colors.grey),
        onGenerateTitle: (context) => "Sharing Data Using Provider",
        initialRoute: TodoOverview2.ROUTE_IDENTIFIER,
        onGenerateRoute: RouteGenerator3.generateRoute,
      ),
    );
  }
}

class SharingDataWithNavigatorMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(primaryColor: Colors.grey),
      onGenerateTitle: (context) => "Sharing Data Using Navigator",
      initialRoute: TodoOverview.ROUTE_IDENTIFIER,
      onGenerateRoute: RouteGenerator2.generateRoute,
    );
  }
}

class RoutingBasicsMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.grey,
      ),
      onGenerateTitle: (context) => "Routing Basics",
      initialRoute: HomePage.ROUTE_IDENTIFIER,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
