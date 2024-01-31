class Todo {
  String? id;
  String? title;
  String? description;
  bool? isCompleted;

  Todo({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    isCompleted: json["isCompleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "isCompleted": isCompleted,
  };
}
