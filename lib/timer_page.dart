import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Timer Page Here')
          ],
        )
      ),
    );
  }
}