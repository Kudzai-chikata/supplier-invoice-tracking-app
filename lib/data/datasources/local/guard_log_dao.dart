// guard_log_dao.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GuardLogDAO {
  Database? _database;

  // Initialize the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Create or open the SQLite database
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'guard_logs.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE guard_audit_logs (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            guard_id TEXT NOT NULL,
            log TEXT NOT NULL,
            timestamp TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // Insert a new guard audit log
  Future<void> insertLog(String guardId, String log) async {
    final db = await database;
    await db.insert(
      'guard_audit_logs',
      {'guard_id': guardId, 'log': log, 'timestamp': '${{new DateTime.now().toIso8601String()}}'},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all guard audit logs
  Future<List<Map<String, dynamic>>> getLogs() async {
    final db = await database;
    return await db.query('guard_audit_logs');
  }

  // Query guard audit logs by guard ID
  Future<List<Map<String, dynamic>>> queryLogsByGuardId(String guardId) async {
    final db = await database;
    return await db.query(
      'guard_audit_logs',
      where: 'guard_id = ?',
      whereArgs: [guardId],
    );
  }
}