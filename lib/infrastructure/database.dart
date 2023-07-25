import 'package:todo_list/barrel.dart'; 
class DBService {
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  Future<String> get fullPath async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath + 'todolists.db');
    return path;
  }

  Future<Database> initDB() async {
    final path = await fullPath;
    return await openDatabase(
      path,
      version: 1,
      onCreate: create,
    );
  }

  FutureOr<void> create(Database db, int version) async {
      return await TodoDB().createTable(db);
    }

}
