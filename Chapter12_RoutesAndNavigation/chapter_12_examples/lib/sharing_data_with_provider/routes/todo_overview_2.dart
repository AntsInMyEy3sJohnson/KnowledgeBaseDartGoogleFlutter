import 'package:chapter_12_examples/sharing_data_with_provider/data/todo_item_cache.dart';
import 'package:chapter_12_examples/sharing_data_with_provider/routes/todo_detail_view_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoOverview2 extends StatelessWidget {
  static const String ROUTE_IDENTIFIER = "/";

  const TodoOverview2();

  @override
  Widget build(BuildContext context) {
    final todoItemCache = context.watch<TodoItemCache>();

    return Scaffold(
      body: ListView.builder(
        itemCount: todoItemCache.numItems,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoItemCache.items[index].title),
            onTap: () {
              todoItemCache.index = index;
              _openDetailPage(context);
            },
          );
        },
      ),
    );
  }

  void _openDetailPage(BuildContext context) =>
      Navigator.pushNamed(context, TodoDetailView2.ROUTE_IDENTIFIER);
}
