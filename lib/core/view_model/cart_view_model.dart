import 'package:ecommerceend/core/services/database/cart_database_helper.dart';
import 'package:ecommerceend/model/cart_product_model.dart';
import 'package:ecommerceend/model/porduct_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  var _products = {}.obs;
  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  void addProduct(ProductModel proudct) {
    if (_products.containsKey(proudct)) {
      _products[proudct] += 1;
    } else {
      _products[proudct] = 1;
    }
    Get.snackbar(
        "Prouduct Added", "you have Added the ${proudct.name}to the cart",
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2));
  }

  void removeProduct(ProductModel product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;
  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
