import 'dart:collection';

import 'package:chapter_12_examples/sharing_data_with_provider/data/todo_item_2.dart';

// Idea: Separate data storage from widget by encapsulating it into its own class,
// then make that class available to interested widgets by means of Provider
class TodoItemCache {

  var _index = -1;

  final List<TodoItem2> _items = [
    TodoItem2("Title 1", "Description 1"),
    TodoItem2("Title 2", "Description 2"),
    TodoItem2("Title 3", "Description 3"),
    TodoItem2("Title 4", "Description 4"),
  ];

  set index(int newIndex) {
    if(newIndex > -1 && newIndex < _items.length) {
      _index = newIndex;
    } else {
      _index = -1;
    }
  }

  UnmodifiableListView<TodoItem2> get items => UnmodifiableListView<TodoItem2>(_items);

  int get index => _index;

  int get numItems => _items.length;

}
