import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit.dart';

class ListOfHabits extends StatelessWidget {
  const ListOfHabits({
    super.key,
    required this.habits,
  });

  final List<Habit> habits;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(14),
      itemCount: habits.length,
      itemBuilder: (BuildContext context, int index) {
        final habit = habits[index];
    
        return DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Container(
            height: 150,
            width: 200,
            color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(habit.title),
                Text(habit.description),
                Text(habit.createdAt),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
