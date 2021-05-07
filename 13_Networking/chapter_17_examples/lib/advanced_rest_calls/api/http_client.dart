import 'package:chapter_17_examples/advanced_rest_calls/api/json_parsers/json_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class RestClient {
  static final String _url = "https://jsonplaceholder.typicode.com/";

  static final Dio _dioClient = Dio(BaseOptions(
    baseUrl: _url,
    connectTimeout: 5000,
    receiveTimeout: 5000,
  ));

  final String endpoint;
  final Map<String, String> data;

  const RestClient({@required this.endpoint, this.data = const {}});

  // Important detail: The parser is passed via method injection rather than
  // being kept somewhere in this class
  Future<T> performGet<T>(JsonParser<T> jsonParser) async {
    final response = await _dioClient.get<String>(endpoint);
    return jsonParser.parseFromJson(response.data);
  }

  Future<T> performPost<T>(JsonParser<T> jsonParser) async {
    final formData = FormData.fromMap(data);
    final response = await _dioClient.post<String>(endpoint, data: formData);
    return jsonParser.parseFromJson(response.data);
  }
}
