import 'package:chapter_12_examples/sharing_data_with_navigator/data/todo_item.dart';
import 'package:flutter/material.dart';

class TodoDetailView extends StatelessWidget {
  static const String ROUTE_IDENTIFIER = "/detail-view";

  final TodoItem todoItem;

  TodoDetailView(this.todoItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${todoItem.title}"),
            Text("${todoItem.description}"),
          ],
        ),
      ),
    );
  }
}
