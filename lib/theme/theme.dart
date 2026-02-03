import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 53, 150, 230),
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: const Color.fromARGB(255, 37, 37, 37),
    ),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 224, 224, 224),
  dividerTheme: DividerThemeData(color: Colors.transparent),
);
