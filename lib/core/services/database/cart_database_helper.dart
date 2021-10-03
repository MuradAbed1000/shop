import 'package:ecommerceend/model/cart_product_model.dart';
import 'package:ecommerceend/model/porduct_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constance.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initdb();
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
        $columproductid TEXT NOT NULL)''');
    });
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClint = await database;
    List<Map> maps = await dbClint!.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((Product) => CartProductModel.fromJson(Product)).toList()
        : [];
    return list;
  }

  insert(CartProductModel model) async {
    var dbClint = await database;
    await dbClint!.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  updateProduct(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient!.update(tableCartProduct, model.toJson(),
        where: '$columproductid= ?', whereArgs: [model.productid]);
  }
}
