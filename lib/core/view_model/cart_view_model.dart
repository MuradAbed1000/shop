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

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += double.parse(
          _cartProductModel[i].price * _cartProductModel[i].quantity);

      print('total price${_totalPrice}');
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productid == cartProductModel.productid) {
        return;
      }

      var daHelper = CartDatabaseHelper.db;
      await daHelper.insert(cartProductModel);
      _cartProductModel.add(cartProductModel);
      _totalPrice +=
          double.parse(cartProductModel.price * cartProductModel.quantity);
      Get.snackbar(
        "Product Added",
        "You have added the ${cartProductModel.name} to the cart",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
      );
    }

    update();
  }

  increaseQuantity(int index) {
    _cartProductModel[index].quantity++;
    _totalPrice += double.parse(
        _cartProductModel[index].price * _cartProductModel[index].quantity);
    update();
  }
}
