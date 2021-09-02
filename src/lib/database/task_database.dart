import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

final String tableTask = 'tasks';

class TaskDB {
  static final TaskDB instance = TaskDB._init();
  static Database? _database;
  TaskDB._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB('taskDB.db');
    return _database!;
  }

  Future<Database> initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return await openDatabase(path, version: 1, onCreate: _creatDB);
  }

  Future _creatDB(Database db, int version) async {
    await db.execute('''
CREAT TABLE $tableTask(

)
''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
