import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_application_1/service/todo_service.dart';

// what servide does?
// crud operations
class TodoServiceStub extends TodoServiceI {
  // Simulate a database with a list
  List<Todo> _todos = [
    Todo(
      id: 1,
      title: 'Todo 1',
      description: 'Description 1',
    ),
    Todo(
      id: 2,
      title: 'Todo 2',
      description: 'Description 2',
    ),
    Todo(
      id: 3,
      title: 'Todo 3',
      description: 'Description 3',
    ),
  ];

  // Method to add a todo
  Future<int> addTodo(String title, String description) async {
    int id = _todos.isNotEmpty
        ? _todos.last.id + 1
        : 1; // Use ID from last element + 1
    Todo todo = Todo(
      id: id,
      title: title,
      description: description,
    );
    // Simulate a delay for async operation
    await Future.delayed(Duration(milliseconds: 500));
    // Add the todo to the list
    _todos.add(todo);
    return todo.id;
  }

  // Method to get all todos
  Future<List<Todo>> getTodos() async {
    // Simulate a delay for async operation
    await Future.delayed(Duration(milliseconds: 500));
    return _todos;
  }

  // Method to remove a todo
  Future<void> removeTodo(int id) async {
    // Simulate a delay for async operation
    await Future.delayed(Duration(milliseconds: 500));
    _todos = _todos.where((todo) => todo.id != id).toList();
  }
}
