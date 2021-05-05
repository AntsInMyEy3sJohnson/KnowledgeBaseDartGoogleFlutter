import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloader with ChangeNotifier {
  final Dio _dio;

  double _downloadProgress;

  FileDownloader()
      : this._downloadProgress = 0,
        this._dio = Dio();

  void startDownload({@required String url, @required String localPath}) async {
    _resetProgress();

    final targetDirectory = await getTemporaryDirectory();
    final targetFilePath = "${targetDirectory.path}/$localPath";

    await _dio.download(url, targetFilePath,
        options: Options(
          headers: {HttpHeaders.acceptEncodingHeader: "*"},
        ), onReceiveProgress: (received, total) {
      if (total != -1) {
        _updateProgress(received / total * 100);
      }
    });
  }

  void _updateProgress(double value) {
    _downloadProgress = value;
    notifyListeners();
  }

  void _resetProgress() {
    if (downloadProgress != 0) {
      _downloadProgress = 0;
      notifyListeners();
    }
  }

  double get downloadProgress => _downloadProgress;
}
