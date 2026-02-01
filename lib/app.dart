import 'package:flutter/material.dart';
import 'package:habit_tracker/features/home/view/home.dart';
import 'package:habit_tracker/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: lightTheme,
      home: HomeWidget(),
    );
  }
}
