import 'dart:async';
import 'dart:math';

class RandomStream {
  final int maxValue;
  static final _random = Random();

  Timer _timer;
  int _currentCount;
  StreamController<int> _controller;

  RandomStream({this.maxValue = 100}) {
    _currentCount = 0;
    // Basically, 'StreamController<T>' is a wrapper class around
    // stream with some useful methods to easily send data, errors,
    // and termination events
    _controller = StreamController<int>(
        onListen: _startStream,
        onResume: _startStream,
        onPause: _stopTimer,
        onCancel: _stopTimer);
  }

  Stream<int> get stream => _controller.stream;

  void _startStream() {
    // Timer will invoke callback periodically with interval given in Duration object
    _timer = Timer.periodic(const Duration(seconds: 1), _runStream);
  }

  void _stopTimer() {
    _timer.cancel();
    _controller.close();
  }

  void _runStream(Timer timer) {
    _currentCount++;
    _controller.add(_random.nextInt(maxValue));
    if (_currentCount == maxValue) {
      _stopTimer();
    }
  }
}
