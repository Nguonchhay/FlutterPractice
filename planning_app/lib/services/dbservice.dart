import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:path/path.dart' as path;
import 'package:sqflite/sql.dart';

class DatabaseService {

  static const String DB_NAME = 'placesapp';

  static Future<void> insert(String tableName, Map<String, Object> data) async {
    final dbPath = await sqlite.getDatabasesPath();
    final sqlDB = await sqlite.openDatabase(path.join(dbPath, DatabaseService.DB_NAME), onCreate: (db, version) {
      return db.execute('CREATE TABLE IF NOT EXIST places(id TEXT primary KEY, title TEXT, image TEXT)');
    }, version: 1);

    await sqlDB.insert(tableName, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}