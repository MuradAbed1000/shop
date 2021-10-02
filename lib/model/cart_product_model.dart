import 'package:ecommerceend/helper/extenstion.dart';
import 'package:flutter/cupertino.dart';

class CartProductModel {
  var name, image, price, productid,quantity;
  
  CartProductModel(
      {this.name, this.image, this.price, this.quantity, this.productid});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];

    price = map['price'];
    quantity = map['quantity'];
    productid = map['productid'];
  }

  //cover my data to json
  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productid': productid
    };
  }
}
