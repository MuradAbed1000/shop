import 'package:ecommerceend/helper/extenstion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? productid, name, image, descripation, sized, price;
  Color? color;
  ProductModel(
      {this.name,
      this.image,
      this.descripation='55',
      this.color=Colors.black,
      this.sized='20',
      this.price='20',
      this.productid='Null',
      });
        static  List<ProductModel> products = [
    ProductModel(
        name: 'Apple',
        price: '2',
        image:
            'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80'),
    ProductModel(
        name: 'Orange',
        price: '2.99',
        image:
            'https://images.unsplash.com/photo-1547514701-42782101795e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
 ];

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
