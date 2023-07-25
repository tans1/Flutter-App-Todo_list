import 'package:todo_list/barrel.dart'; 

class TodoProvider {
  final todoDB = TodoDB();

  Future<int> create(Map<String, dynamic> todo) async {
    return await todoDB.create(todo);
  }

  Future<List<TodoList>> fetchAll() async {
    return await todoDB.getAll();
  }

  Future<TodoList> getById({required int id}) async {
    return await todoDB.getById(id);
  }

  Future<List<TodoList>> getByCategory({required String category}) async {
    return await todoDB.getByCategory(category);
  }

  Future<List<String>> getAllCategories() async {
    return await todoDB.getAllCategories();
  }

  Future<int> update(Map<String, dynamic> todo) async {
    return await todoDB.update(todo);
  }

  Future deleteById({required int id}) async {
    return await todoDB.deleteById(id);
  }
}
