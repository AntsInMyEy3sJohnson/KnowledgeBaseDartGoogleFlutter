import 'package:chapter_17_examples/advanced_rest_calls/api/json_models/todo.dart';
import 'package:chapter_17_examples/advanced_rest_calls/api/json_parsers/todo_parser.dart';
import 'package:chapter_17_examples/advanced_rest_calls/api/rest_client.dart';
import 'package:flutter/material.dart';

class ItemDownloader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ItemDownloaderState();
}

class _ItemDownloaderState extends State<ItemDownloader> {
  Future<List<Todo>> _todoFuture;

  @override
  void initState() {
    super.initState();
    _todoFuture = RestClient(endpoint: "/todos").performGet(const TodoParser());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _todoFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Todo> todos = snapshot.data;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title),
              );
            },
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Icon(Icons.error_rounded),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
