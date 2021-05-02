import 'package:chapter_17_examples/http_get_requests/item_http_request.dart';
import 'package:chapter_17_examples/http_get_requests/widgets/request_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static const _url = "https://jsonplaceholder.typicode.com/posts/42";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP Requests',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HTTP Requests")
        ),
        body: const Center(
          child: HttpWidget(ItemHttpRequest(url: _url)),
        ),
      ),
    );
  }
}
