import 'package:chapter_17_examples/http_get_requests/data/item.dart';
import 'package:chapter_17_examples/commons/http_request.dart';
import 'package:chapter_17_examples/http_get_requests/widgets/http_request_error_widget.dart';
import 'package:chapter_17_examples/http_get_requests/widgets/http_request_successful_widget.dart';
import 'package:flutter/material.dart';

class GetRequestPage extends StatefulWidget {
  final SimpleGetRequest<Item> _httpRequest;

  const GetRequestPage(this._httpRequest);

  @override
  State<StatefulWidget> createState() => _GetRequestPageState();
}

class _GetRequestPageState extends State<GetRequestPage> {
  Future<Item> _itemsFuture;

  @override
  void initState() {
    super.initState();
    // 'initState()' runs only once as soon as the Widget is put into the
    // widget tree
    // Thus, the HTTP call will also only be performed once
    // Caution: Take extra care not to invoke any HTTP call -- or trigger
    // a method that performs one -- inside the 'build()' method since
    // 'build()' is run every time the widget is built, and hence the HTTP
    // call would be executed for each widget build!
    // Generally: Rebuilds happen more often than one might expect and sometimes,
    // it is not entirely predictable just when a rebuild will be run. Therefore,
    // try to make sure the 'build()' only contains what's really necessary for the
    // widget to be built!
    _itemsFuture = widget._httpRequest.perform();
  }

  @override
  Widget build(BuildContext buildContext) {
    // FutureBuilder: Very useful for handling Futures
    // Inside the builder method, the status of the Future is encapsulated
    // in the 'snapshot' variable, so one can easily react to state changes
    return FutureBuilder<Item>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          // Will evaluate to 'true' in case any exception occurs during performing
          // whatever call the Future encapsulates
          if (snapshot.hasError) {
            return const HttpRequestErrorWidget();
          }
          // Becomes 'true' once the Future completes without error
          if (snapshot.hasData) {
            return HttpRequestSuccessfulWidget(snapshot.data);
          }
          // If no error has occurred and the Future does not have data yet,
          // it means the Future is still being executed
          // To inform the user something is happening, show a progress indicator
          return const Center(child: CircularProgressIndicator());
        });
  }
}
