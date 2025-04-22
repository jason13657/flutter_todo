import 'package:flutter_application_1/model/todo.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class TodoServiceI {
  Future<int> addTodo(String title, String description);
  Future<List<Todo>> getTodos();
  Future<void> removeTodo(int id);
}

// what servide does?
// crud operations
class TodoServiceWithSqlLite extends TodoServiceI {
  Database database;

  TodoServiceWithSqlLite(this.database);

  // Method to add a todo
  @override
  Future<int> addTodo(String title, String description) async {
    int id = await database.insert("todos", {
      "title": title,
      "description": description,
    });
    return id;
  }

  // Method to get all todos
  @override
  Future<List<Todo>> getTodos() async {
    List<Map<String, dynamic>> map = await database.query("todos");

    List<Todo> todos = map.map((e) {
      return Todo.fromJson(e);
    }).toList();

    return todos;
  }

  // Method to remove a todo
  @override
  Future<void> removeTodo(int id) async {
    await database.delete("todos", where: "id = ?", whereArgs: [id]);
  }
}
