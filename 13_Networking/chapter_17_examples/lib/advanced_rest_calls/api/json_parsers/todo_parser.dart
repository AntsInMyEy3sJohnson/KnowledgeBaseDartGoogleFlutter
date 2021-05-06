import 'package:chapter_17_examples/advanced_rest_calls/api/json_models/todo.dart';
import 'package:chapter_17_examples/advanced_rest_calls/api/json_parsers/json_parser.dart';

class TodoParser extends JsonParser<List<Todo>> with ListDecoder<List<Todo>> {
  const TodoParser();

  @override
  Future<List<Todo>> parseFromJson(String json) async {
    return decodeJsonList(json)
        .map((e) => Todo.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
