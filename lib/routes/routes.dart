import 'package:habit_tracker/features/habit/view/habit_screen.dart';
import 'package:habit_tracker/features/home/view/home.dart';

final routes = {
  '/': (context) => const HomeWidget(),
  '/habit_screen': (context) => const HabitScreen(),
};
