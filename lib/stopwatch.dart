class stopwatch_contents {
  String printTime(int milli) {
    final minutes = (milli ~/ 60000) % 60;
    final seconds = (milli ~/ 1000) % 60;
    final millisecondsRemaining = milli % 1000;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    String millsecondsStr =
        (millisecondsRemaining ~/ 10).toString().padLeft(2, '0');
    print('$minutesStr分$secondsStr.$millsecondsStr秒');
    return '$minutesStr:$secondsStr.$millsecondsStr';
  }

  int displaytime(DateTime startTime, int pastTime) {
    print('stop!!\n');
    final nowTime = DateTime.now();
    final mill = nowTime.difference(startTime).inMilliseconds;
    int milli = pastTime + mill;
    return milli;
  }

  DateTime start(DateTime startTime, bool running) {
    if (running == false) {
      print('start!!');
      return DateTime.now();
    } else {
      print('stopwatch is already running');
      return startTime;
    }
  }

  int stop(DateTime startTime, bool running, int pastTime) {
    if (running == true) {
      print('stop!!\n');
      final nowTime = DateTime.now();
      final mill = nowTime.difference(startTime).inMilliseconds;
      int milli = pastTime + mill;
      print('$nowTime - $startTime + $pastTime');
      printTime(milli);
      return milli;
    } else {
      print('stopwatch isn`t running');
      return 0;
    }
  }

  int resetTime() {
    print('reset!!');
    return 0;
  }
}
