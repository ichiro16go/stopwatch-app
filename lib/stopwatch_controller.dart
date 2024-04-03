// 没

import 'dart:io';
import 'dart:async';

class Stopwatch {
  // Timer? timer;
  // void start(int timeInt, String time) {
  //   timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
  //     timeInt++;
  //     time = displaytime(timeInt);
  //     print(time);
  //   });
  // }

  // void stop() {
  //   timer?.cancel();
  // }

  // void reset(int timerInt) {
  //   timerInt = 0;
  //   print('reset!!');
  // }

  String displaytime(int timerInt) {
    int minutes = timerInt ~/ (6000);
    int seconds = (timerInt ~/ 100) % 60;
    int centsecond = timerInt % 100;
    return '$minutes:$seconds.$centsecond';
  }
}
