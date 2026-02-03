import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({super.key, required this.habit});
  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Habit')),
      body: Center(child: Column(children: [Text(habit.description)])),
    );
  }
}