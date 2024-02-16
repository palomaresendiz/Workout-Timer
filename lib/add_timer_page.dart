import 'package:flutter/material.dart';
import 'package:stretch_timer/timer_page.dart';

class AddTimerPage extends StatelessWidget {
  const AddTimerPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF1976D2),
        title: const Text('Add a Workout Timer',
          style: TextStyle(fontSize: 23,
            color: Colors.white
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              const Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(' How many exercises\ndo you want in this\ntimer?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 100),
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
              const Padding(padding: EdgeInsets.only(top: 20, bottom: 90)),
              const Row(
                children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(' How many seconds\n for each exercise?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23
                      ),
                    ),
                  ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 110),
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
              const Padding(padding: EdgeInsets.only(top: 20, bottom: 90)),
              const Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(' How many seconds\n for each break in \n between?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 110),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: const EdgeInsets.only(top: 210),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1976D2),
                      ),
                      onPressed: ()=> {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const TimerPage(title: 'ThirdPage');
                        }))
                      },
                      child: const Text('Start Timer', 
                      style: TextStyle(color: Colors.white,
                      fontSize: 20),
                      ),
                    ),
                  ),
                ]
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
  int numExercises = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 25, width: 25),
        DropdownButton<int>(
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20
          ),
          value: numExercises,
          items: List.generate(20, (index) {
            return DropdownMenuItem<int>(
              value: index + 1,
              child: Text((index + 1).toString()),
            );
          }),
          onChanged: (value) {
            setState(() {
              numExercises = value!;
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
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20
          ),
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
  int secondsBreak = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        DropdownButton<int>(
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20
          ),
          value: secondsBreak,
          items: [5, 10, 15, 20].map((int seconds) {
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

