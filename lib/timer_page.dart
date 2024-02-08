import 'package:flutter/material.dart';
import 'package:stretch_timer/add_timer_page.dart';
import 'dart:async';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Column(
              children: [
                Text("Timer here",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  )
                )
              ]
            ),
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 200, bottom: 100)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go back!'),
                ),
                const Padding(padding: EdgeInsets.only(top: 100)),
              ],
            )
          ],
        ),
      )
    );
  }
}