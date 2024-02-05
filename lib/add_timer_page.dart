import 'package:flutter/material.dart';

class AddTimerPage extends StatelessWidget {
  const AddTimerPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF1976D2),
        title: const Text('Add a Workout Timer'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 50)),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(' How many exercises do \n you want in this timer?',
                        style: TextStyle(
                        fontSize: 20
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        NumExercisesDropdownMenu()
                      ]
                    )
                  )
                ]
              ),
              Padding(padding: EdgeInsets.only(top: 20, bottom: 50)),
              Row(
                children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(' How many seconds\n for each exercise?',
                      style: TextStyle(
                      fontSize: 20
                      ),
                    ),
                  ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 75),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SecondsExerciseDropdownMenu()
                      ]
                    )
                  )
                ]
              ),
              Padding(padding: EdgeInsets.only(top: 20, bottom: 50)),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(' How many seconds\n for each break in \n between?',
                        style: TextStyle(
                        fontSize: 20
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 75),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SecondsBreakDropdownMenu()
                      ]
                    )
                  )
                ]
              ),
              Row(
                //SUBMIT/OK BUTTON HERE
              ),
            ],
          )  
          ),
        ),
      );
  }
}

class NumExercisesDropdownMenu extends StatefulWidget {
  const NumExercisesDropdownMenu({super.key});

  @override
  State<NumExercisesDropdownMenu> createState() => _NumExercisesDropdownMenuState();
}

class _NumExercisesDropdownMenuState extends State<NumExercisesDropdownMenu> {
  int numExercies = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        DropdownButton<int>(
          value: numExercies,
          items: List.generate(20, (index) {
            return DropdownMenuItem<int>(
              value: index + 1,
              child: Text((index + 1).toString()),
            );
          }),
          onChanged: (value) {
            setState(() {
              numExercies = value!;
            });
          },
        ),
      ],
    );
  }
}

class SecondsExerciseDropdownMenu extends StatefulWidget {
  const SecondsExerciseDropdownMenu({super.key});

  @override
  State<SecondsExerciseDropdownMenu> createState() => _SecondsExerciseDropdownMenuState();
}

class _SecondsExerciseDropdownMenuState extends State<SecondsExerciseDropdownMenu> {
  int secondsExercise = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        DropdownButton<int>(
          value: secondsExercise,
          items: [15, 30, 45, 60].map((int seconds) {
            return DropdownMenuItem<int>(
              value: seconds,
              child: Text('$seconds'),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              secondsExercise = value!;
            });
          },
        ),
      ],
    );
  }
}

class SecondsBreakDropdownMenu extends StatefulWidget {
  const SecondsBreakDropdownMenu({super.key});

  @override
  State<SecondsBreakDropdownMenu> createState() => _SecondsBreakDropdownMenuState();
}

class _SecondsBreakDropdownMenuState extends State<SecondsBreakDropdownMenu> {
  int secondsBreak = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        DropdownButton<int>(
          value: secondsBreak,
          items: [15, 30, 45, 60].map((int seconds) {
            return DropdownMenuItem<int>(
              value: seconds,
              child: Text('$seconds'),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              secondsBreak = value!;
            });
          },
        ),
      ],
    );
  }
}
