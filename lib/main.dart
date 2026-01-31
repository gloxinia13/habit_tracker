import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:intl/intl.dart';

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
        dividerTheme: DividerThemeData(color: Colors.transparent),
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
  List<Habit> habits = [];
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  String title = '';
  String description = '';

  void _addHabit() async {
    final habit = await _dialog();
    if (habit == null) return;
    setState(() {
      habits.add(habit);
    });
  }

  final _formKey = GlobalKey<FormState>();
  Future<Habit?> _dialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add habit'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.title),
                          label: Text('Title *'),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'The title must not be empty!';
                          }
                          return null;
                        },
                        controller: titleController,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.description),
                          label: Text('Description *'),
                        ),
                        validator: (String? value) {
                          return (value == null ? 'Error' : null);
                        },
                        controller: descriptionController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, null);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;

                final now = DateTime.now();
                final formatter = DateFormat('dd-MM-yyyy HH:mm');

                final habit = Habit(
                  title: titleController.text,
                  description: descriptionController.text,
                  createdAt: formatter.format(now),
                );

                titleController.clear();
                descriptionController.clear();
                Navigator.pop(context, habit);
              },
              child: const Text('Approve'),
            ),
          ],
        );
      },
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addHabit();
        },
        shape: CircleBorder(),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
