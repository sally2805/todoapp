import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoapp/model.dart';



class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('todo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 8,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    await db.execute('''
    CREATE TABLE users ( 
      id $idType, 
      username $textType,
      password $textType
      )
    ''');

    await db.execute('''
    CREATE TABLE todo ( 
      id $idType, 
      title $textType,
      description $textType,
      category $integerType,
      date $textType,
      starttime $textType,
      endtime $textType 
        
      )
    ''');
  }

  Future<int> create(Todo todo) async {
    final db = await instance.database;
    return await db.insert('todoo', todo.toMap());
  }


  Future<List<Todo>> readAllTodos() async {
    final db = await instance.database;
    const orderBy = 'date ASC';
    final result = await db.query('todoo', orderBy: orderBy);
    return result.map((json) => Todo.fromMap(json)).toList();
  }

  Future<int> update(Todo todo) async {
    final db = await instance.database;
    return db.update(
      'todo',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }


  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }


  Future<int> insert(User user) async {
    Database db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<int> updateUser(User user) async {
    Database db = await instance.database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [1], 
    );
  }

  Future<User?> queryUser() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('users');
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
