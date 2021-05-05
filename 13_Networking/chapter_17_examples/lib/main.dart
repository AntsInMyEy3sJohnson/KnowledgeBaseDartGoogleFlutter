import 'package:chapter_17_examples/http_get_requests/item_http_request.dart';
import 'package:chapter_17_examples/http_get_requests/widgets/request_page.dart';
import 'package:chapter_17_examples/http_post_requests/routes.dart';
import 'package:chapter_17_examples/http_post_requests/routes/post_request_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  _dioStuff();
  runApp(MyApp());
}

void _dioStuff() async {
  /* Dio stuff -- preparation for sample app that downloads and stores a file */
  final dio = Dio();

  try {
    final response1 =
        await dio.get<String>("https://jsonplaceholder.typicode.com/posts/42");
    print("${response1.data}");

    // Note the simple handling of the JSON body to be POSTed
    final response2 = await dio.post<String>(
        "https://jsonplaceholder.typicode.com/posts",
        data: {"userId": 42, "title": "Some title", "body": "Some body"});
    print("${response2.data}");

    // Passing in some query parameters is also very simple
    final response3 = await dio.get<String>(
        "https://jsonplaceholder.typicode.com/posts",
        queryParameters: {"userId": 1});
    print("${response3.data}");

    // One can also put information common to a bunch of calls into a 'BaseOptions'
    // object and then pass that object into the Dio object's constructor
    final baseOptions = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      connectTimeout: 3000,
    );
    final dio2 = Dio(baseOptions);
    final chainedResponse = await Future.wait([
      dio2.get<String>("/posts"),
      dio2.get<String>("/posts?userId=5"),
      dio2.get<String>("/posts",
          options: Options(headers: {
            "Foo": "Bar",
          }))
    ]);

  } on DioError catch (e) {
    print(e);
  }
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
      onGenerateTitle: (_) => "HTTP Requests",
      initialRoute: PostRequestPage.ROUTE_ID,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
