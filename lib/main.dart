import 'package:flutter/material.dart';
import './stopwatch_controller.dart';
import 'dart:async';

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
  final SW = Stopwatch();
  Timer? timer;
  int timeInt = 0;
  String displayTime = "00:00.00";
  void start() {
    print("start");
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        timeInt++;
        displayTime = SW.displaytime(timeInt);
        print(displayTime);
      });
    });
  }

  void stop() {
    print("stop");
    timer?.cancel();
  }

  void reset() {
    print("reset");
    setState(() {
      timeInt = 0;
      displayTime = "00:00.00";
    });
    print("00:00.00");
    timer?.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              //時間を表示
              displayTime,
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
                      start();
                      setState(() {});
                    },
                    child: const Icon(Icons.play_arrow,
                        color: Colors.white, size: 40)),
                FloatingActionButton(
                  onPressed: () {
                    stop();
                    setState(() {});
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
                    reset();
                    setState(() {});
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
