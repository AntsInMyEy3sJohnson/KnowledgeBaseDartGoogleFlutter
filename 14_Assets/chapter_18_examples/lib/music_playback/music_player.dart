import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class MusicPlayer extends StatelessWidget {
  static final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  const MusicPlayer();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.open_in_browser_sharp),
              onPressed: () => _assetsAudioPlayer
                  .open(Audio("assets/audio/mysamplesong.m4a")),
            ),
            StreamBuilder<Duration>(
              stream: _assetsAudioPlayer.currentPosition,
              builder: (context, AsyncSnapshot<Duration> duration) {
                if (duration.hasData) {
                  // if (duration.data ?? false) {
                  //   return const Text("No playback time available");
                  // }
                  final time = duration.data;
                  return Text("${time.inMinutes}:${time.inSeconds}");
                }

                return const Text("<Start>");
              },
            ),
            StreamBuilder<bool>(
              stream: _assetsAudioPlayer.isPlaying,
              builder: (context, AsyncSnapshot<bool> asyncSnapshot) {
                if (asyncSnapshot.data ?? false) {
                  return IconButton(
                    icon: const Icon(Icons.pause_circle_filled_sharp),
                    onPressed: () => _assetsAudioPlayer.pause(),
                  );
                }
                return IconButton(
                  icon: const Icon(Icons.play_arrow_sharp),
                  onPressed: () => _assetsAudioPlayer.play(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
