import 'package:ecommerceend/core/services/database/cart_database_helper.dart';
import 'package:ecommerceend/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

   addProduct(CartProductModel CartProductModel) async {
    var daHelper = CartDatabaseHelper.db;
    await daHelper.insert(CartProductModel);

    Get.snackbar(
      "Product Added",
      "You have added the ${CartProductModel.name} to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
    update();
  }
}
