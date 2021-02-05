import 'package:chapter_12_examples/sharing_data_with_navigator/data/todo_item.dart';
import 'package:chapter_12_examples/sharing_data_with_navigator/routes/todo_detail_view.dart';
import 'package:flutter/material.dart';

class TodoOverview extends StatelessWidget {
  // There always needs to be a route with the URI "/" as the "home page"!
  static const String ROUTE_IDENTIFIER = "/";

  final List<TodoItem> todoItems = [
    TodoItem("Title 1", "Description 1"),
    TodoItem("Title 2", "Description 2"),
    TodoItem("Title 3", "Description 3"),
    TodoItem("Title 4", "Description 4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          final item = todoItems[index];
          return ListTile(
            title: Text(item.title),
            onTap: () => _itemTapped(context, item),
          );
        },
      ),
    );
  }

  void _itemTapped(BuildContext context, TodoItem todoItem) =>
      Navigator.pushNamed(context, TodoDetailView.ROUTE_IDENTIFIER, arguments: todoItem);
}
