import 'dart:convert';

import 'package:chapter_17_examples/commons/http_request.dart';
import 'package:chapter_17_examples/http_post_requests/data/post.dart';

import 'package:http/http.dart' as http;

class PostHttpRequest implements SimplePostRequest<Post> {
  final String url;

  const PostHttpRequest({this.url});

  @override
  Future<Post> perform(String body) async {
    final response =
        await http.post(url, body: body, encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    }

    throw HttpRequestException("${response.statusCode}: ${response.body}");
  }
}
