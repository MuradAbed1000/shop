import 'package:ecommerceend/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constance.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initdb();
    }
    return _database;
  }

  initdb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE $tableCartProduct(
        $columName TEXT NOT NULL,
        $columImage TEXT NOT NULL,
        $columPrice TEXT NOT NULL,
        $columQuantity INTEGER NOT NULL,
      ) ''');
    });
  }

  insert(CartProductModel model) async {
    var dbClint = await database;
    await dbClint!.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
