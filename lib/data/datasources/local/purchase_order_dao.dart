import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PurchaseOrderDAO {
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'purchase_orders.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE purchase_orders(id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER, price REAL)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertPurchaseOrder(Map<String, dynamic> purchaseOrder) async {
    final db = await database;
    await db.insert(
      'purchase_orders',
      purchaseOrder,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getPurchaseOrders() async {
    final db = await database;
    return await db.query('purchase_orders');
  }

  Future<void> updatePurchaseOrder(int id, Map<String, dynamic> purchaseOrder) async {
    final db = await database;
    await db.update(
      'purchase_orders',
      purchaseOrder,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deletePurchaseOrder(int id) async {
    final db = await database;
    await db.delete(
      'purchase_orders',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}