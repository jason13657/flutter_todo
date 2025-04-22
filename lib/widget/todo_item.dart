import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  void _onDelete(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    try {
      todoProvider.removeTodo(todo.id);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(todo.description),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            _onDelete(context);
          },
        ),
      ),
    );
  }
}
