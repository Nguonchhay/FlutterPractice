import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DatabaseService {

  static const String DB_NAME = 'placesapp';

  static Future<Database> initDatabase() async {
    final dbPath = await sqlite.getDatabasesPath();
    return sqlite.openDatabase(path.join(dbPath, DatabaseService.DB_NAME), onCreate: (db, version) {
      return db.execute('CREATE TABLE IF NOT EXISTS places(id TEXT primary KEY, title TEXT, image TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String tableName, Map<String, Object> data) async {
    final db = await DatabaseService.initDatabase();
    await db.insert(tableName, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> query(String tableName) async {
    final db = await DatabaseService.initDatabase();
    return db.query(tableName);
  }
}