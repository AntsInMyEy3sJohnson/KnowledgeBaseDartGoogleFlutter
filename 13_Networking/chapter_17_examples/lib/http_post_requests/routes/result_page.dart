import 'package:chapter_17_examples/http_post_requests/data/post.dart';
import 'package:chapter_17_examples/http_post_requests/post_http_request.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  static const String URL = "https://jsonplaceholder.typicode.com/posts";
  static const String ROUTE_ID = "/result-page";

  final PostHttpRequest _postHttpRequest;
  final String _postAsJson;

  ResultPage(this._postAsJson)
      : this._postHttpRequest = PostHttpRequest(url: URL);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Future<Post> _postFuture;

  @override
  void initState() {
    super.initState();
    _postFuture = widget._postHttpRequest.perform(widget._postAsJson);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _postFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Icon(Icons.error_rounded));
          }
          if (snapshot.hasData) {
            return const Center(child: Icon(Icons.check));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
