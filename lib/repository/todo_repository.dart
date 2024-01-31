import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoRepository{
  final CollectionReference firebaseCollection = FirebaseFirestore.instance.collection('todos');
  /// Load todos data from firestore
  Future<List<Todo>?> getTodos() async {
    try {
      final QuerySnapshot querySnapshot =
      await firebaseCollection.get();
      return querySnapshot.docs
          .map((doc) => Todo.fromJson(doc.data() as Map<String,dynamic>))
          .toList();
    } on FirebaseException catch (e) {
      debugPrint("Firebase Authentication Error: ${e.message}");
    }catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return null;
  }

  Future<void> addTodo(String title,String description) async {
    try {
      String id = firebaseCollection.doc().id;
      Todo todo = Todo(id: id, title: title,description: description,isCompleted:false);
      await firebaseCollection.doc(id).set(todo.toJson());
    } on FirebaseException catch (e) {
      debugPrint("Firebase Authentication Error: ${e.message}");
    }catch (e) {
      debugPrint("Error adding todo: $e");
    }
  }

  Future<void> updateTodos(Todo todo) async {
    try {
      await firebaseCollection.doc(todo.title).update({
        'isCompleted': todo.isCompleted,
      });
    } on FirebaseException catch (e) {
      debugPrint("Firebase Authentication Error: ${e.message}");
    }catch (e) {
      debugPrint("Error toggling todo: $e");
    }
  }

  Future<void> removeTodo(Todo todo) async {
    try {
      await firebaseCollection.doc(todo.title).delete();
    } on FirebaseException catch (e) {
      debugPrint("Firebase Authentication Error: ${e.message}");
    }catch (e) {
      debugPrint("Error removing todo: $e");
    }
  }
}