import 'package:ecommerceend/constance.dart';
import 'package:ecommerceend/core/view_model/cart_view_model.dart';
import 'package:ecommerceend/model/cart_product_model.dart';
import 'package:ecommerceend/model/porduct_model.dart';
import 'package:ecommerceend/view/widget/Coustom_Button_sgin.dart';
import 'package:ecommerceend/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel? model;
  int index;

  DetailsView({
    Key? key,
    this.model,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Image.network(
                  '${model!.image}',
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        CustomText(
                          text: model!.name,
                          fontsize: 26,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Size',
                                  ),
                                  CustomText(
                                    text: model!.sized,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Color',
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                        color: model!.color),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: 'Details',
                          fontsize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: model!.descripation,
                          fontsize: 18,
                          spaceLine: 2.5,
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'PRICE',
                        fontsize: 18,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: '\$${model!.price}',
                        color: primaryColor,
                        fontsize: 18,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) => Container(
                      width: 180,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      child: CoustomButtonSgin(
                        onPressed: () => controller.addProduct(ProductModel.products[index]),
                        text: 'Add',
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
