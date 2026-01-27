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
        dividerTheme: DividerThemeData(
          color: Colors.transparent
        )
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
    final box = _createHabit('Title');
    setState(() {
      habits.add(box);
    });
  }

  Widget _createHabit(String title) {
    return Center(
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 135, 206),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(14),
        itemCount: habits.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 150,
            width: 200,
            color: Colors.green,
            child: Center(child: habits[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return const Divider();
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
