import 'package:flutter/material.dart';
import 'package:stretch_timer/add_timer_page.dart';
import 'dart:async';

import 'package:stretch_timer/main.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key, required this.title, required this.numExercises, required this.secondsExercise, required this.secondsBreak}) : super(key: key);

  final String title;
  final int numExercises;
  final int secondsExercise;
  final int secondsBreak;

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _currentExercise = 1;
  int _secondsRemaining = 3;
  late Timer _timer;
  bool _isExerciseTimer = false;
  bool _isCountdownTimer = true;

  @override
  void initState() {
    super.initState();
    _countdownTimer();
  }

  void _countdownTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _isCountdownTimer = true;
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();

          if (_currentExercise <= widget.numExercises) {
            _startExerciseTimer();
          }
        }
      });
    });
  }

  void _startExerciseTimer() {
    setState(() {
      _secondsRemaining = widget.secondsExercise;
      _currentExercise++;
      _isExerciseTimer = true;
      _isCountdownTimer = false;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();

          if (_currentExercise <= widget.numExercises) {
            // Start Break Timer
            _startBreakTimer();
          }
        }
      });
    });
  }

  void _startBreakTimer() {
    setState(() {
      _secondsRemaining = widget.secondsBreak;
      _isExerciseTimer = false;
      _isCountdownTimer = false;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();

          // Start the next Exercise Timer
          _startExerciseTimer();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color scaffoldColor;
    if (_isCountdownTimer) {
      scaffoldColor = Colors.yellow;
    } else {
      scaffoldColor = _isExerciseTimer ? Colors.green : const Color.fromARGB(255, 250, 23, 6);
    }

    String displayText = 
    _isCountdownTimer ? 'Starting in\n        $_secondsRemaining' : '$_secondsRemaining';

    return Scaffold(
      body: Container(
        color: scaffoldColor,
        child: Center(
          child: Text(displayText,
            style: const TextStyle(fontSize: 65,
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