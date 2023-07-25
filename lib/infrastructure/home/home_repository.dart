import 'package:todo_list/barrel.dart'; 

class TodoDB {
  final tableName = 'todos';
  Future<void> createTable(Database db) async {
    await db.execute("""CREATE TABLE IF NOT EXISTS $tableName(
        'id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        'title' TEXT NOT NULL,
        'description' TEXT,
        'category' TEXT,
        'date' TEXT,
        'done' INTEGER DEFAULT 0
      )
      """);
  }

  Future<int> create(Map<String, dynamic> todo) async {
    final db = await DBService().database;
    int id = await db.insert(tableName, todo,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<TodoList>> getAll() async {
    final db = await DBService().database;
    final todos = await db.query(tableName, orderBy: 'date DESC');
    return List.generate(todos.length, (index) {
      return TodoList.fromDB(todos[index]);
    });
  }

  Future<TodoList> getById(int id) async {
    final db = await DBService().database;
    final todo = await db.query(tableName, where: 'id = ?', whereArgs: [id]);
    return TodoList.fromDB(todo.first);
  }

  Future<List<TodoList>> getByCategory(String category) async {
    final db = await DBService().database;
    final todo =
        await db.query(tableName, where: 'category = ?', whereArgs: [category]);
    return List.generate(todo.length, (index) {
      return TodoList.fromDB(todo[index]);
    });
  }

  Future<List<String>> getAllCategories() async {
    final db = await DBService().database;
    final List<Map<String, dynamic>> categoryMapList =
        await db.query(tableName, columns: ['category']);

    final List<String> categories =
        categoryMapList.map((map) => map['category'] as String).toList();

    return categories;
  }

  Future<int> update(Map<String, dynamic> todo) async {
    final db = await DBService().database;
    return await db.update(tableName, todo,
        where: 'id = ?',
        whereArgs: [todo['id']],
        conflictAlgorithm: ConflictAlgorithm.rollback);
  }

  Future deleteById(int id) async {
    final db = await DBService().database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
