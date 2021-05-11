import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class MusicPlayer extends StatelessWidget {
  
  // Static because, in this case, the track to be played is always the same, 
  // so it does not make sense coupling this instance to the instance of its
  // enclosing class. 
  // Make this an instance variable in case different files are to be played.
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
              // Instead of 'open()' to load a single audio file,
              // one can invoke 'openPlaylist()' to load n songs
              // into a playlist
              // If this were a StatefulWidget, we probably would have 
              // opened the file once in the 'initState()' method
              onPressed: () => _assetsAudioPlayer
                  .open(Audio("assets/audio/mysamplesong.m4a")),
            ),
            // We'd probably use a FutureBuilder here in most cases, but the 
            // 'assets_audio_player' package works with Streams rather than Futures, 
            // so a StreamBuilder is used instead. The setup is the same as for 
            // FutureBuilders, though.
            StreamBuilder<Duration>(
              stream: _assetsAudioPlayer.currentPosition,
              builder: (context, AsyncSnapshot<Duration> duration) {
                if (duration.hasData) {
                  final time = duration.data;
                  return Text("${time.inMinutes}:${time.inSeconds}");
                }

                // The snapshot not containing data means there is currently no 
                // audio file playing, so we can emit a corresponding message
                return const Text("No audio playing");
              },
            ),
            StreamBuilder<bool>(
              stream: _assetsAudioPlayer.isPlaying,
              builder: (context, AsyncSnapshot<bool> currentlyPlaying) {
                if (currentlyPlaying.data ?? false) {
                  // "if currentlyPlaying is not null..."
                  // 'currentlyPlaying' being non-null means an audio file
                  // is currently being played, so show a pause button
                  // rather than a play button
                  return IconButton(
                    icon: const Icon(Icons.pause_circle_filled_sharp),
                    // Tear-off used rather than lambda
                    onPressed:  _assetsAudioPlayer.pause,
                  );
                }
                return IconButton(
                  icon: const Icon(Icons.play_arrow_sharp),
                  // In case a playlist was loaded, the following methods
                  // can be used for playback:
                  // * playlistNext()
                  // * playlistPrev()
                  // * playlistPlayAtIndex(n)
                  onPressed: _assetsAudioPlayer.play,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
