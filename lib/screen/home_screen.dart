import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'package:flutter_application_1/widget/todo_form.dart';
import 'package:flutter_application_1/widget/todo_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    await todoProvider.getTodos();
    setState(() {
      _isLoading = false;
    });
  }

  void _notifyError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  _showAddTodoForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return TodoForm(notifyError: _notifyError);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddTodoForm(context),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Consumer<TodoProvider>(
              builder: (context, todoProvider, child) {
                return TodoList(todos: todoProvider.todos);
              },
            ),
    );
  }
}
