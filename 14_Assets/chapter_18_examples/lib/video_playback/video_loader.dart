import 'package:chapter_18_examples/video_playback/video_player.dart';
import 'package:chapter_18_examples/video_playback//volume_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart' as flutterVideo;

class VideoLoader extends StatefulWidget {
  const VideoLoader();

  @override
  State<StatefulWidget> createState() => _VideoLoaderState();
}

class _VideoLoaderState extends State<VideoLoader> {
  flutterVideo.VideoPlayerController _videoPlayerController;
  Future<void> _initVideoFuture;

  @override
  void initState() {
    super.initState();

    // 'asset()' is not the only named constructor available -- there is also
    // 'file()' and 'network()
    _videoPlayerController = flutterVideo.VideoPlayerController.asset(
        "assets/videos/mysamplevideo.mov");
    _videoPlayerController.setLooping(false);

    _initVideoFuture = _videoPlayerController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initVideoFuture,
      builder: (context, snapshot) {
        // The future this builder uses does not return any data, so
        // we cannot evaluate its completion state using 'snapshot.hasData()'
        // as done in previous examples. Instead, we have to use the snapshot's
        // 'connectionState' property
        if (ConnectionState.done == snapshot.connectionState) {
          // Once the VideoPlayerController has initialized the video, the Future
          // state will be 'done', and the video will be ready for playback
          return ChangeNotifierProvider<VolumeManager>(
            create: (_) => VolumeManager(),
            child: VideoPlayer(_videoPlayerController),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  void dispose() {
    // Always keep in mind to dispose of the controller instance once the widget
    // gets removed from the widget tree to avoid memory leaks
    _videoPlayerController.dispose();
    super.dispose();
  }
}
