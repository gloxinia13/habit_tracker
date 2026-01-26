import 'package:flutter/material.dart';

void main() {
  final app = App();
  runApp(app);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 211, 211, 211),
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<Widget> habits = [];

  void _addHabit() {
    FractionallySizedBox box = FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(color: Colors.green),
    );
    setState(() {
      habits.add(box);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 135, 206),
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber,
            child: Center(child: habits[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addHabit,
        shape: CircleBorder(),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
