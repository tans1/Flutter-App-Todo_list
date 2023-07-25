class TodoList {
  final int id;
  final String title;
  final String description;
  final String category;
  final String date;
  final bool done;

  TodoList(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.date,
      this.done = false,
      });

  factory TodoList.fromDB(Map<String, dynamic> map) {
    return TodoList(
        id: map['id'].toInt() ?? 0,
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        category: map['category'] ?? '',
        date: map['date'] ?? DateTime.now(),
        done: map['done'] == 1 ? true : false,
        );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'date': date,
      "done": done?1:0
    };
  }
}
