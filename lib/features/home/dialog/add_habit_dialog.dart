import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:intl/intl.dart';

class AddHabitDialog extends StatefulWidget {
  const AddHabitDialog({super.key});

  @override
  State<AddHabitDialog> createState() => _AddHabitDialogState();
}

class _AddHabitDialogState extends State<AddHabitDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    controller: _titleController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.description),
                      label: Text('Description *'),
                    ),
                    validator: (String? value) {
                      return (value == null ? 'Error' : null);
                    },
                    controller: _descriptionController,
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
              title: _titleController.text,
              description: _descriptionController.text,
              createdAt: formatter.format(now),
            );

            _titleController.clear();
            _descriptionController.clear();
            Navigator.pop(context, habit);
          },
          child: const Text('Approve'),
        ),
      ],
    );
  }
}
