import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'package:flutter_application_1/service/todo_service.dart';
import 'package:flutter_application_1/test/service/todo_service_stub.dart';

void main() {
  // TodoServiceI todoService = TodoService();
  TodoServiceI todoServiceStub = TodoServiceStub();
  TodoProvider todoProvider = TodoProvider(todoServiceStub);

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
