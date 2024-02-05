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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('How many exercises do you want in this timer?',
            style: TextStyle(
              fontSize: 20
            ),
            ),
            NumExercisesDropdownMenu(),
          ],
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
