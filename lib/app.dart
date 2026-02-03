import 'package:flutter/material.dart';
import 'package:habit_tracker/routes/routes.dart';
import 'package:habit_tracker/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: lightTheme,
      routes: routes
    );
  }
}
