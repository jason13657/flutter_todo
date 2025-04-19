import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'package:provider/provider.dart';

typedef NotifyError = void Function(String message);

class TodoForm extends StatefulWidget {
  final NotifyError notifyError;

  const TodoForm({super.key, required this.notifyError});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';

  void _addTodo(BuildContext context) {
    if (_validateForm() != null) {
      widget.notifyError(_validateForm()!);
      return;
    }

    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    try {
      todoProvider.addTodo(_title, _description);
      Navigator.of(context).pop();
    } catch (e) {
      widget.notifyError(e.toString());
    }
  }

  String? _validateForm() {
    if (_title.isEmpty) {
      return 'Title cannot be empty';
    }
    if (_description.isEmpty) {
      return 'Description cannot be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              _title = value;
            },
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            onChanged: (value) {
              _description = value;
            },
            decoration: const InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            _addTodo(context);
          },
          child: const Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
