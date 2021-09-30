import 'package:ecommerceend/helper/extenstion.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  var name, image, descripation, color, sized, price;
  ProductModel(
      {this.name,
      this.image,
      this.descripation,
      this.color,
      this.sized,
      this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    descripation = map['descripation'];
    color = map['color'];
    sized = map['sized'];
    price = map['price'];
  }

  //cover my data to json
  toJson() {
    return {
      'name': name,
      'image': image,
      'descripation': descripation,
      'color': color,
      'sized': sized,
      'price': price
    };
  }
}
