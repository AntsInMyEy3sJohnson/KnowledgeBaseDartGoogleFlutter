import 'package:dio/dio.dart';

class SvgFileDownloader {

  static final _baseOptions = BaseOptions(
    baseUrl: "https://raw.githubusercontent.com/dnfield/",
    connectTimeout: 5000,
    responseType: ResponseType.bytes,
  );

  static final _dioClient = Dio(_baseOptions);

  final String _endpoint;

  const SvgFileDownloader(this._endpoint);

  // In case requests are to be made against multiple endpoints and with varying
  // base options, consider passing in the Dio client via method injection rather
  // than encapsulating it in this class
  Future<List<int>> startDownload() async {
    final request = await _dioClient.get<List<int>>(_endpoint);
    return request.data;
  }

}