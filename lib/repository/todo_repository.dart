import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoRepository{
  final CollectionReference firebaseCollection = FirebaseFirestore.instance.collection('todos');
  /// Load todos data from firestore
  Future<List<Todo>> getTodos() async {
    try {
      final QuerySnapshot querySnapshot =
      await firebaseCollection.get();
      print("hghg");
      return querySnapshot.docs
          .map((doc) => Todo.fromJson(doc.data() as Map<String,dynamic>))
          .toList();
    } catch (e) {
      return throw 'Error: ${e}';
    }
  }

  Future<void> addTodo(String title,String description) async {
      String id = firebaseCollection.doc().id;
      Todo todo = Todo(id: id, title: title,description: description,isCompleted:false);
      await firebaseCollection.doc(id).set(todo.toJson());
  }

  Future<void> updateTodos(Map<String,dynamic> data,String id) async {
      await firebaseCollection.doc(id).update(
        data
      );
  }

  Future<void> removeTodo(String id) async {
    await firebaseCollection.doc(id).delete();
  }
}