import 'dart:convert';

import 'package:chapter_17_examples/commons/http_request.dart';
import 'package:http/http.dart' as http;

import 'data/item.dart';

class ItemHttpRequest implements SimpleGetRequest<Item> {
  final String url;

  const ItemHttpRequest({this.url});

  @override
  Future<Item> perform() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    }

    throw HttpRequestException("${response.statusCode}: ${response.body}");
  }
}
