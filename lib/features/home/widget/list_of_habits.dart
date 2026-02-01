import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit.dart';

class ListOfHabits extends StatelessWidget {
  const ListOfHabits({super.key, required this.habits});
  final List<Habit> habits;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double widgetHeight = screenHeight * 0.15;

    return ListView.separated(
      padding: EdgeInsets.all(14),
      itemCount: habits.length,
      itemBuilder: (BuildContext context, int index) {
        final habit = habits[index];

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green
          ),
          height: widgetHeight,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  habit.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(198, 42, 42, 42),
                  ),
                ),
                Text(habit.description, style: TextStyle(fontSize: 18)),
                Text(habit.createdAt, style: TextStyle(fontSize: 12)),
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
