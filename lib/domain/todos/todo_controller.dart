import 'package:todo_list/barrel.dart';

class TodoController {
  final BuildContext context;

  TodoController(this.context);

  Future<void> handleTodo({
    required String title,
    required String description,
    required String category,
    required String date,
  }) async {
    HomeBloc().add(CreateTodo(
      title: title,
      description: description,
      category: category,
      date: date,
    ));
    HomeBloc().add(GetAll());
    Navigator.pop(context);
  }
}
