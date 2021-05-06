import 'package:chapter_17_examples/file_download/download_screen.dart';
import 'package:chapter_17_examples/file_download/file_downloader.dart';
import 'package:chapter_17_examples/http_get_requests/item_http_request.dart';
import 'package:chapter_17_examples/http_get_requests/widgets/request_page.dart';
import 'package:chapter_17_examples/http_post_requests/routes.dart';
import 'package:chapter_17_examples/http_post_requests/routes/post_request_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() {
  // _dioStuff();
  // runApp(MyApp());
  runApp(MyDownloadApp());
}

class MyDownloadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FileDownloader>(
      create: (_) => FileDownloader(),
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text("Download demo"),
        ),
        body: Center(
          child: const DownloadScreen(),
        ),
      )),
    );
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

void _dioStuffForUploadingData() async {
  final fileDir = await getTemporaryDirectory();
  final filePath1 = "$fileDir/someFile.txt";
  final filePath2 = "$fileDir/anotherFile.jpeg";

  // Assemble payload
  final singleFilePayload = FormData.fromMap({
    "someFormKey": "someFormValue",
    "file": await MultipartFile.fromFile(filePath1),
  });

  // This would be the call to upload the data -- not actually invoked here
  // await Dio().post("https://some-url.com/some-endpoint", data: payload);

  // The same approach can be used to upload multiple files, too
  final multiFilePayload = FormData.fromMap({
    "someOtherFormKey": "someValue",
    "moreFiles": [
      await MultipartFile.fromFile(filePath1),
      await MultipartFile.fromFile(filePath2),
      // Further useful methods:
      // MultipartFile.fromBytes()
      // MultipartFile.fromFile()
      // MultipartFile.fromString()

      // Dio even has interceptors -- they are akin to event listeners in that
      // they can be run every time a certain action is performed
      // Interceptors can, for example, be used to implement retries
      // in case of a download that has failed
    ]
  });

  // To change the encoding from the default ("multipart/from-data") to some
  // other value, the 'Options' object can be used in the request:
  /*await Dio().post(
    "https://example.org/endpoint",
    data: multiFilePayload,
    options: Options(
      contentType: Headers.formUrlEncodedContentType,
    ),
  );*/


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
