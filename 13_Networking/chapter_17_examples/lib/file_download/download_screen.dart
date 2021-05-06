import 'package:chapter_17_examples/file_download/file_downloader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DownloadScreen extends StatelessWidget {
  final String fileUrl =
      "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4";

  const DownloadScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<FileDownloader>(
        // For listening to upload or download progress, rely on a state management
        // library like 'provider' or 'flutter_bloc' as often as possible -- avoid
        // using 'setState()'
        builder: (context, status, _) {
          final downloadProgress = status.downloadProgress.toStringAsFixed(1);
          return ElevatedButton(
            child: Text("$downloadProgress %"),
            onPressed: () => status.startDownload(
                url: fileUrl, localPath: "my_sample_video.mp4"),
          );
        },
      ),
    );
  }
}
