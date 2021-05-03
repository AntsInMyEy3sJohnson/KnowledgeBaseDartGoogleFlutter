import 'dart:convert';
import 'dart:ffi';

import 'package:chapter_17_examples/commons/http_request.dart';
import 'package:chapter_17_examples/http_post_requests/data/post.dart';

import 'package:http/http.dart' as http;

class PostHttpRequest implements SimplePostRequest<Post> {
  final String url;

  const PostHttpRequest({this.url});

  @override
  Future<Post> perform(String body) async {
    // When issuing only a single HTTP call, using 'http.get()' or 'http.post()'
    // is fine, but in case multiple requests are to be made against the same
    // server, employing an instance of 'http.Client' is preferable.
    // See dummy method below
    final response =
        await http.post(url, body: body, encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    }

    throw HttpRequestException("${response.statusCode}: ${response.body}");
  }

  /// Dummy method showing examples for how to make use of 'http.Client()'
  void _performWithClient(String body) async {

    final client = http.Client();

    try {
      final firstRequest = await client.get("https://some.url");
      final secondRequest = await client.get("https://some-other.url");
    } finally {
      client.close();
    }

  }
}
