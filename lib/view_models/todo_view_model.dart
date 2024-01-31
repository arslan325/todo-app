import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/repository/todo_repository.dart';

class TodoViewModel extends ChangeNotifier {
  List<Todo> todos = [];
  final TodoRepository _repository = TodoRepository();

  Future<void> loadTodos() async {
    todos = await _repository.getTodos() ?? [];
    notifyListeners();
  }

  Future<void> addTodo(String title,String description) async {
    if (todos.length >= 10) {
      // Limit reached, show dialog
      // Implement your dialog logic here
      return;
    }
    await _repository.addTodo(title,description);
    await loadTodos();
  }

  Future<void> toggleTodo(Todo todo) async {
    await _repository.updateTodos(todo);
    await loadTodos();
  }

  Future<void> removeTodo(Todo todo) async {
    await _repository.removeTodo(todo);
    await loadTodos();
  }
}
