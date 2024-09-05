import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseFlutter {
  DatabaseFlutter? _database1;

  Database? _database;
  String Database_Name = 'user.db';
/* دى معمولة عشان أول ما ندخل بيانات تتأكد اذا كان فى داتا بيز و لا لأ أو تحديث أو مسح */
/* تانى فايدة و هى عشان لما المستخدم يعمل تسجيل دخول تتعمل الدات بيز  */
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await pathAndDb();
    return _database!;
  }

  Future<Database> pathAndDb() async {
    //دى عشان نعمل مسار
    final dbPath = await getDatabasesPath();
    // وهنا نحط اسم الداتا بيز فى المسار و يبقى المسار كامل
    final path = join(dbPath, Database_Name);

    return await openDatabase(path, version: 1, onCreate: _create);
  }

  Future _create(Database db, int version) async {
    await db.execute('''
CREATE TABLE tabtab(
id INTEGER PRIMARY KEY,
email TEXT NOT NULL,
password TEXT NOT NULL
)
''');
  }

  Future<int> inser_(
      {required String id, required String pass, required String email}) async {
    final db = await _database1!.database;
    return await db.insert('tabtab', {'id': id, 'email': email, 'pass': pass});
  }
  //I finish insert ,you start from update 'mohamed abdallah'

  Future<int> update(
    String Id,
    String User,
    String Pass,
  ) async {
    final db = await _database1!.database;
    return db.update(
      'tabtab',
      {'username': User, 'password': Pass},
      where: 'id = $Id',
      /* 
       where: 'id = ?',
       // بالعربي بيقوله العامود ده القيمة اللي جواه هتتبدل بالقيمة اللي هتديها في whereargs
      // this means that the id column will update it's data
      whereArgs: [Id],
      // this means that the id will be changed using this id parameter
      //where: 'id = $Id', this is not a vaild one
      */
    );
  }

  Future<int> delete(
    String Id,
    String User,
    String Pass,
  ) async {
    final db = await _database1!.database;
    return await db.delete(
      'tabtab',
      where: 'id = ?',
      whereArgs: [Id],
    );
  }
}
