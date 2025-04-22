import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'package:flutter_application_1/service/todo_service.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await openDatabase(
    join(await getDatabasesPath(), 'todo_database.db'),
    version: 1,
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, description TEXT, isCompleted INTEGER DEFAULT 0)',
      );
    },
  );

  TodoServiceI todoService = TodoServiceWithSqlLite(database);
  TodoProvider todoProvider = TodoProvider(todoService);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TodoProvider>(
        create: (context) => todoProvider,
      ),
    ],
    child: MaterialApp(
      title: 'Todo list',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    ),
  ));
}
