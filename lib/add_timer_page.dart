import 'package:flutter/material.dart';

const List<int> numExercisesList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

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
  int dropdownValue = numExercisesList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<int>(
      initialSelection: numExercisesList.first,
      onSelected: (int? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: numExercisesList.map<DropdownMenuEntry<int>>((int value) {
        return DropdownMenuEntry<int>(value: value, label: 'boogah');
      }).toList(),
    );
  }
}
