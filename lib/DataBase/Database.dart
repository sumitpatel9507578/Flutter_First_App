import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBhelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), "user_db.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            phone TEXT,
            password TEXT,
            image TEXT
          )
        ''');
      },
    );
  }

  Future<int> addUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String image,
  }) async {
    final db = await database;

    return await db.insert("users", {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "image": image,
    });
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query("users");
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(
      "users",
      where: "id = ?",
      whereArgs: [id],
    );
  }
  Future<int> updateUser({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String password,
    required String image,
}) async {
    final db=await database;
    return await db.update("users",
    {
      "name":name,
      "email":email,
      "phone":phone,
      "password":password,
      "image":image,

    },
      where: "id=?",
      whereArgs: [id],
    );
  }
}