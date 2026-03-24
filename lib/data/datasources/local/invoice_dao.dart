import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ReceivedInvoice {
  int id;
  String field1; // Modify according to your actual fields
  String field2; // Modify according to your actual fields

  ReceivedInvoice({required this.id, required this.field1, required this.field2});
}

class InvoiceDao {
  static Database? _database;

  // Singleton pattern
  static final InvoiceDao _instance = InvoiceDao._internal();
  factory InvoiceDao() => _instance;
  InvoiceDao._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('invoices.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    return await openDatabase(
      join(await getDatabasesPath(), filePath),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE received_invoices(
            id INTEGER PRIMARY KEY,
            field1 TEXT,
            field2 TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertInvoice(ReceivedInvoice invoice) async {
    final db = await database;
    await db.insert(
      'received_invoices',
      {'id': invoice.id, 'field1': invoice.field1, 'field2': invoice.field2},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ReceivedInvoice>> getInvoices() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('received_invoices');
    return List.generate(maps.length, (i) {
      return ReceivedInvoice(
        id: maps[i]['id'],
        field1: maps[i]['field1'],
        field2: maps[i]['field2'],
      );
    });
  }

  Future<void> updateInvoice(ReceivedInvoice invoice) async {
    final db = await database;
    await db.update(
      'received_invoices',
      {'field1': invoice.field1, 'field2': invoice.field2},
      where: 'id = ?',
      whereArgs: [invoice.id],
    );
  }

  Future<void> syncInvoices(List<ReceivedInvoice> invoices) async {
    final db = await database;
    await db.transaction((txn) async {
      for (var invoice in invoices) {
        await txn.insert(
          'received_invoices',
          {'id': invoice.id, 'field1': invoice.field1, 'field2': invoice.field2},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<void> deleteInvoice(int id) async {
    final db = await database;
    await db.delete(
      'received_invoices',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}