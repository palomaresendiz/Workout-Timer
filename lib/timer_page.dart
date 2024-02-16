import 'package:flutter/material.dart';
import 'package:stretch_timer/add_timer_page.dart';
import 'dart:async';

import 'package:stretch_timer/main.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _secondsRemaining = 3;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExerciseTimer())
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 252, 228, 12),
        child: Center(
          child: Text('Starting in\n        $_secondsRemaining',
            style: const TextStyle(fontSize: 50,
            color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class ExerciseTimer extends StatefulWidget {
  @override
  _ExerciseTimerState createState() => _ExerciseTimerState();
}

class _ExerciseTimerState extends State<ExerciseTimer> {
  int _secondsRemaining = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: Text('$_secondsRemaining',
            style: const TextStyle(fontSize: 50,
            color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}