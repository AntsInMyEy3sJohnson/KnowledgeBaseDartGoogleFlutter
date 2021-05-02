import 'package:chapter_17_examples/http_get_requests/data/item.dart';
import 'package:flutter/material.dart';

class HttpRequestSuccessfulWidget extends StatelessWidget {
  final Item _item;

  HttpRequestSuccessfulWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${_item.id}: ${_item.title}",
      textAlign: TextAlign.center,
    );
  }
}
