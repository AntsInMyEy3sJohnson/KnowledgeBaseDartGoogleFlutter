import 'dart:typed_data';

import 'package:chapter_18_examples/working_with_svg_files/downloader_with_error_handling/svg_file_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WebSvgIconViewer extends StatefulWidget {
  const WebSvgIconViewer();

  @override
  _WebSvgIconViewerState createState() => _WebSvgIconViewerState();
}

class _WebSvgIconViewerState extends State<WebSvgIconViewer> {
  SvgFileDownloader _svgFileDownloader;
  Future<List<int>> _svgImageFuture;

  @override
  void initState() {
    super.initState();
    _svgFileDownloader = SvgFileDownloader(
        "flutter_svg/7d374d7107561cbd906d7c0ca26fef02cc01e7c8/example/assets/flutter_logo.svg?sanitize=true");
    _svgImageFuture = _svgFileDownloader.startDownload();
  }

  @override
  Widget build(BuildContext context) {
    // The StatefulWidget is required because we don't want the FutureBuilder
    // to perform the download invocation many times -- by means of the 'initState()'
    // method, we can make sure the request is carried out only once
    // Caution: This pattern ALWAYS applies when working with Futures!
    return Center(
      child: FutureBuilder(
        future: _svgImageFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return SvgPicture.memory(
                Uint8List.fromList(snapshot.data),
                placeholderBuilder: (_) => const CircularProgressIndicator(),
              );
            } else {
              return _ErrorWidget();
            }
          }

          if (snapshot.hasError) {
            return _ErrorWidget();
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Icon(Icons.error_outline);
}
