import 'package:chapter_18_examples/video_playback/volume_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart' as flutterVideo;

class VideoPlayer extends StatelessWidget {
  final flutterVideo.VideoPlayerController _videoPlayerController;

  const VideoPlayer(this._videoPlayerController);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // The 'AspectRatio' widget attempts to size its child (here: the
        // Flutter VideoPlayer) according to the value provided for its
        // 'aspectRatio' property
        AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: flutterVideo.VideoPlayer(_videoPlayerController),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () => _playVideo(),
              child: const Text("Play"),
            ),
            ElevatedButton(
              onPressed: () => _pauseVideo(),
              child: const Text("Pause"),
            ),
          ],
        ),
        Consumer<VolumeManager>(
          builder: (context, volumeManager, _) {
            return Slider(
              value: volumeManager.volume,
              onChanged: (value) {
                volumeManager.setVolume(
                    newVolume: value,
                    videoPlayerController: _videoPlayerController);
              },
              min: 0,
              max: 100,
              divisions: 10,
              label: "${volumeManager.volume} %",
            );
          },
        ),
      ],
    );
  }

  void _playVideo() {
    if (!_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
  }

  void _pauseVideo() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
    }
  }
}
