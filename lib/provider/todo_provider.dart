import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_application_1/service/todo_service.dart';

// provider layer
class TodoProvider with ChangeNotifier {
  List<Todo> _todos = []; // state
  int maxTodos = 10; // max todos

  TodoServiceI todoService;

  get todos => _todos;

  // Dependency injection
  TodoProvider(
    this.todoService,
  );

  Future<void> getTodos() async {
    _todos = await todoService.getTodos();
    notifyListeners();
  }

  Future<void> addTodo(String name, String description) async {
    _isFull();

    await todoService.addTodo(name, description);
    _todos = await todoService.getTodos();
    notifyListeners();
  }

  void _isFull() {
    if (_todos.length >= maxTodos) {
      throw Exception('Max todos reached');
    }
  }
}
