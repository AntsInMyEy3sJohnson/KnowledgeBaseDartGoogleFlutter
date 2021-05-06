import 'package:chapter_17_examples/advanced_rest_calls/api/json_models/post.dart';
import 'package:chapter_17_examples/advanced_rest_calls/api/json_parsers/json_parser.dart';

class PostParser extends JsonParser<Post> with ObjectDecoder<Post> {

  const PostParser();

  @override
  Future<Post> parseFromJson(String json) async {
    final Map<String, dynamic> jsonMap = decodeJsonObject(json);
    return Post.fromJson(jsonMap);
  }

}