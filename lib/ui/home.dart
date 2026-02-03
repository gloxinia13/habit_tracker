import 'package:flutter/material.dart';
import 'package:habit_tracker/ui/habit_list/dialog/add_habit_dialog.dart';
import 'package:habit_tracker/ui/habit_list/habit_list/habit_list.dart';
import 'package:habit_tracker/models/habit.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<Habit> habits = [];

  String title = '';
  String description = '';

  void _addHabit() async {
    final habit = await showDialog<Habit>(
      context: context,
      builder: (_) => const AddHabitDialog()
    );
    if (habit == null) return;
    setState(() {
      habits.add(habit);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
      ),
      body: ListOfHabits(habits: habits),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addHabit();
        },
        shape: CircleBorder(),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

