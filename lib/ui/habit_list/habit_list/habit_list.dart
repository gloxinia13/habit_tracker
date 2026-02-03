import 'package:flutter/material.dart';
import 'package:habit_tracker/ui/single_habit/single_habit/habit_screen.dart';
import 'package:habit_tracker/models/habit.dart';

class ListOfHabits extends StatefulWidget {
  const ListOfHabits({super.key, required this.habits});
  final List<Habit> habits;

  @override
  State<ListOfHabits> createState() => _ListOfHabitsState();
}

class _ListOfHabitsState extends State<ListOfHabits> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double widgetHeight = screenHeight * 0.15;

    return ListView.separated(
      padding: EdgeInsets.all(14),
      itemCount: widget.habits.length,
      itemBuilder: (BuildContext context, int index) {
        final habit = widget.habits[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => HabitScreen(habit: widget.habits[index]),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 140, 140, 140),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 210, 210, 210),
                  const Color.fromARGB(255, 175, 175, 175),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            height: widgetHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
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
                    Text(
                      habit.createdAt,
                      style: TextStyle(fontSize: 12, fontFamily: 'Oswald'),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.habits.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
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
