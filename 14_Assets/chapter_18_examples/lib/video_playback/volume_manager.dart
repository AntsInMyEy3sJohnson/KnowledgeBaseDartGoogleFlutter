import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VolumeManager with ChangeNotifier {
  double _volume = 20.0;

  double get volume => _volume;

  void setVolume(
      {@required double newVolume,
        // 'VideoPlayerController' provided by 'video_player' package -- used to
        // interact with video playback (start, pause, resume, stop playback)
        // and change volume
      @required VideoPlayerController videoPlayerController}) {
    _volume = newVolume;
    videoPlayerController.setVolume(_volume);

    notifyListeners();
  }
}
