// 没

import 'dart:io';
import 'dart:async';

class Stopwatch {
  DateTime startTime = DateTime(0, 0, 0, 0, 0);
  int totalTime = 0;
  bool running = false;
  String _displayedTime = "00:00.00";

  void printTime(int totalTime) {
    final minutes = (totalTime ~/ 60000) % 60;
    final seconds = (totalTime ~/ 1000) % 60;
    final millisecondsRemaining = totalTime % 1000;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    String millsecondsStr =
        (millisecondsRemaining ~/ 10).toString().padLeft(2, '0');
    print("Time is $minutesStr:$secondsStr.$millsecondsStr");
    _displayedTime = "$minutesStr:$secondsStr:$millsecondsStr";
  }

  void changeRunningState() {
    if (running == true) {
      running = false;
      print("Stoping");
    } else {
      running = true;
      print("Running");
    }
  }

  void start() {
    startTime = DateTime.now();
    changeRunningState();
    print("starttime is $startTime");
  }

  void startTimeController() {
    if (running == false) {
      start();
    }
  }

  void stop() {
    final nowTime = DateTime.now();
    final mill = nowTime.difference(startTime).inMicroseconds;
    int temp = totalTime + mill;
    totalTime = temp;
    changeRunningState();
    printTime(totalTime);
  }

  void StopController() {
    if (running == true) {
      stop();
    }
  }

  void reset() {
    totalTime = 0;
  }

  void resetController() {
    if (running == true) {
      stop();
    } else {}
    reset();
  }

  void updateTime() {
    if (running == true) {
      final nowTime = DateTime.now();
      final mill = nowTime.difference(startTime).inMicroseconds;
      int temp = totalTime + mill;
      totalTime = temp;
    }
  }

  String get displayedTime => _displayedTime;
}
