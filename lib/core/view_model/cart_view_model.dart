import 'package:ecommerceend/core/services/database/cart_database_helper.dart';
import 'package:ecommerceend/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;
  num get totalPrice => _totalPrice;
  num _totalPrice = 0.0;
  CartViewModel() {
    getAllProduct();
  }
  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProduct();
    print(_cartProductModel.length);
    _loading.value = false;
    getTotalPrice();
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    if (_cartProductModel.length == 0) {
      var daHelper = CartDatabaseHelper.db;
      await daHelper.insert(cartProductModel);
      Get.snackbar(
        "Product Added",
        "You have added the ${cartProductModel.name} to the cart",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
      );
    } else {
      for (int i = 0; i < _cartProductModel.length; i++) {
        if (_cartProductModel[i].productid == cartProductModel.productid) {
          return;
        } else {
          var daHelper = CartDatabaseHelper.db;
          await daHelper.insert(cartProductModel);
          Get.snackbar(
            "Product Added",
            "You have added the ${cartProductModel.name} to the cart",
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 2),
          );
        }
      }
    }

    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice +=double.parse(_cartProductModel[i].price* _cartProductModel[i].quantity);
          
      print('total price${_totalPrice}');
      update();
    }
  }
}
