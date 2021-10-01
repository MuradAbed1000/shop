import 'package:ecommerceend/helper/extenstion.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  String? productid, name, image, descripation, sized, price;
  Color? color;
  ProductModel(
      {this.name,
      this.image,
      this.descripation,
      this.color,
      this.sized,
      this.price,
      this.productid
      });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    descripation = map['descripation'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productid = map['productId'];
  }

  //cover my data to json
  toJson() {
    return {
      'name': name,
      'image': image,
      'descripation': descripation,
      'color': color,
      'sized': sized,
      'price': price,
      'productId': productid
    };
  }
}
