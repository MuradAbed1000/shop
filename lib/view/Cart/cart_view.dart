import 'package:ecommerceend/constance.dart';
import 'package:ecommerceend/core/view_model/cart_view_model.dart';
import 'package:ecommerceend/model/porduct_model.dart';
import 'package:ecommerceend/view/widget/Coustom_Button_sgin.dart';
import 'package:ecommerceend/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CartView extends StatelessWidget {
  final CartViewModel controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cRET'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CartProduct(),
            CartTotal(
             
            ),
          ],
        ),
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  final CartViewModel controller = Get.find();
  CartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 550,
        child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductCard(
                controller: controller,
                index: index,
                product: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartViewModel controller;
  final ProductModel product;
  final int quantity;
  final int index;
  CartProductCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(product.image.toString()),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text(product.name.toString())),
          IconButton(
              onPressed: () {
                controller.removeProduct(product);
              },
              icon: Icon(Icons.remove_circle)),
          Text(quantity.toString()),
          IconButton(
              onPressed: () {
                controller.addProduct(product);
              },
              icon: Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  final CartViewModel controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.only(right: 30, left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomText(
                  text: 'TOTAL',
                  fontsize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 15,
                ),
                
                   CustomText(
                    color: primaryColor,
                    fontsize: 15,
                    text: 'mm',
                  ),
                
                SizedBox(height: 10,)
              ],
            ),
            Container(
                height: 90,
                width: 170,
                padding: EdgeInsets.all(20),
                child: CoustomButtonSgin(
                  onPressed: () {},
                  text: 'CHECKOUT',
                ))
          ],
        ),
      
    );
    //  GetBuilder<CartViewModel>(
    //  builder:   (controller)=> Container(
    //     padding: const EdgeInsets.only(left: 30, right: 30),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Column(
    //           children: [
    //             CustomText(
    //               text: 'TOTAL',
    //               fontsize: 12,
    //               color: Colors.grey,
    //             ),
    //             SizedBox(
    //               height: 15,
    //             ),

    //                  CustomText(
    //                      text: '\$${controller.total}',
    //                       fontsize: 18,
    //                       color: primaryColor,
    //                     )
    //           ],
    //         ),
    //         Container(
    //            height: 90,
    //            width: 170,
    //             padding: EdgeInsets.all(20),
    //             child: CoustomButtonSgin(
    //               onPressed: () {},
    //               text: 'CHECKOUT',
    //             ))
    //       ],
    //     ),

    //      ),
    //  );
  }
}
