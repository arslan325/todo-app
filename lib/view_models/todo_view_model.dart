import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/repository/todo_repository.dart';

class TodoViewModel extends ChangeNotifier {
  List<Todo> todos = [];
  final TodoRepository _repository = TodoRepository();

  Future<void> loadTodos() async {
    todos = await _repository.getTodos();
    notifyListeners();
  }

  Future<bool> addTodo(String title,String description) async {
    if (todos.length >= 2) {
      // Limit reached, show dialog
      // Implement your dialog logic here
      return false;
    }
    await _repository.addTodo(title,description);
    await loadTodos();
    return true;
  }

  Future<void> updateTodo(Map<String,dynamic> data,String id) async {
    await _repository.updateTodos(data,id);
    await loadTodos();
  }

  Future<void> removeTodo(String id) async {
    await _repository.removeTodo(id);
    await loadTodos();
  }
}
