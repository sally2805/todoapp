import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseFlutter {
  DatabaseFlutter? _database1;
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await PathandDb('todo.db');
    return _database!;
  }
  Future<Database> PathandDb(String namedb) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, namedb);

    return await openDatabase(path, version: 1, onCreate: _create);
  }

  Future _create(Database db, int version) async {
    await db.execute('''
CREATE TABLE tabtab(id INTEGER PRIMARY KEY,
email TEXT NOT NULL,
password TEXT NOT NULL

)

''');
  }
  Future<int> inser_(String id,pass,email ) async {
    final db = await _database1!.database;
    return await db.insert('dod',{
      'id':id,
      'email':email,
      'pass':pass
    } );
  }
  //I finish insert ,you start from update 'mohamed abdallah'
}
