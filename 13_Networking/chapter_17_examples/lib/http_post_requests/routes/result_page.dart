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
    // Good place to initialize a Future<T> is always the 'initState()' method
    // in order to prevent each rebuild from triggering whatever call the Future<T>
    // encapsulates (here: an HTTP call towards an online API)
    _postFuture = widget._postHttpRequest.perform(widget._postAsJson);
  }

  @override
  Widget build(BuildContext context) {
    // The best way to wait for a Future to complete in a Flutter app is the
    // 'FlutterBuilder' widget
    return FutureBuilder(
        future: _postFuture,
        // This builder function will be invoked many times, hence using a
        // 'const' constructor as often as possible is vital
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
