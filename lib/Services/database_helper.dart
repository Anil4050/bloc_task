import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabaseHelper {
  static final LocalDatabaseHelper _instance = LocalDatabaseHelper._internal();

  factory LocalDatabaseHelper() => _instance;
  static Database? _database;

  LocalDatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'localcrud.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(''' CREATE TABLE items (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          title TEXT, 
          description TEXT 
          ) ''');
    });
  }

  Future<void> insertItem(String title, String description) async {
    final db = await database;
    await db.insert('items', {'title': title, 'description': description});
  }
}
