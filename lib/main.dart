import 'package:flutter/material.dart';
import './stopwatch_controller.dart';
import 'dart:async';
import 'stopwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SW = stopwatch_contents();
  DateTime startTime = DateTime(0, 0, 0, 0, 0);
  bool running = false;
  int totaltime = 0;
  String displayTime = '00:00.00';

  //Timerを使うとなぜかうまくいかず
  // Timer? timer;
  // @override
  // void initState() {
  //   super.initState();
  //   timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
  //     if (running) {
  //       setState(() {
  //         totaltime = SW.displaytime(startTime, totaltime);
  //       });
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stopwatch",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              SW.printTime(totaltime), //時間を表示
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 70),
            ),
            const Padding(padding: EdgeInsets.all(40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                    backgroundColor: Colors.green,
                    onPressed: () {
                      setState(() {
                        startTime = SW.start(startTime, running);
                        running = true;
                        totaltime = SW.displaytime(startTime, totaltime);
                      });
                    },
                    child: const Icon(Icons.play_arrow,
                        color: Colors.white, size: 40)),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      // dispose();
                      totaltime = SW.stop(startTime, running, totaltime);
                      running = false;
                    });
                  },
                  backgroundColor: Colors.yellow,
                  child: const Icon(
                    Icons.stop,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      totaltime = SW.resetTime();
                      dispose();
                    });
                  },
                  backgroundColor: Colors.red,
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 40,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
