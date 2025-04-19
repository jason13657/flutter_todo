import 'package:flutter_application_1/model/todo.dart';

abstract class TodoServiceI {
  Future<int> addTodo(String title, String description);
  Future<List<Todo>> getTodos();
  Future<void> removeTodo(int id);
}

// what servide does?
// crud operations
class TodoService extends TodoServiceI {
  // Method to add a todo
  Future<int> addTodo(String title, String description) async {
    return 1;
  }

  // Method to get all todos
  Future<List<Todo>> getTodos() async {
    return [];
  }

  // Method to remove a todo
  Future<void> removeTodo(int id) async {}
}
