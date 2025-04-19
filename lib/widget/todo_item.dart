import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(todo.description),
      ),
    );
  }
}
