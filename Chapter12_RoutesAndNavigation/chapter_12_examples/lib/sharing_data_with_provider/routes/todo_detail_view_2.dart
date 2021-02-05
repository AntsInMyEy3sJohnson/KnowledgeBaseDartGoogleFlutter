import 'package:chapter_12_examples/sharing_data_with_provider/data/todo_item_cache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoDetailView2 extends StatelessWidget {
  static const String ROUTE_IDENTIFIER = "/detail-view";

  const TodoDetailView2();

  @override
  Widget build(BuildContext context) {
    final todoItemCache = context.watch<TodoItemCache>();
    final currentItem = todoItemCache.items[todoItemCache.index];

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${currentItem.title}"),
            Text("${currentItem.description}"),
          ],
        ),
      ),
    );
  }
}
