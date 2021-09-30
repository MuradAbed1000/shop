import 'package:ecommerceend/constance.dart';
import 'package:ecommerceend/view/widget/Coustom_Button_sgin.dart';
import 'package:ecommerceend/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CartView extends StatelessWidget {
  List<String> name = <String>[
    'muard',
    'muard',
    'muard',
    'muard',
    'muard',
  ];
  List<String> images = <String>[
    'assets/images/chaire.png',
    'assets/images/chaire.png',
    'assets/images/chaire.png',
    'assets/images/chaire.png',
    'assets/images/chaire.png',
  ];
  List<double> price = <double>[
    100,
    200,
    300,
    400,
    500,
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                      child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                      height: 140,
                      child: Row(
                        children: [
                          Container(
                              width: 140,
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.fill,
                              )),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: name[index],fontsize: 24,),SizedBox(height: 10,),
                              CustomText(color: primaryColor, text: '\$${price[index]}',),SizedBox(height: 20,),
                              Container(
                                width: 140,
                                height: 40,
                                color: Colors.grey.shade200,
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Icon(Icons.add,color: Colors.black,),
                                  SizedBox(width: 20,),
                                  CustomText(
                                    alignment: Alignment.center,
                                    text: '1',
                                    fontsize: 20,
                                    color: Colors.black,
                                    ),
                                  SizedBox(width: 20,),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Icon(Icons.minimize,color: Colors.black,)),
              
                                ],)
                              )
                            ],
                          ),
                        )
                        ],
                      ));
                },
                itemCount: name.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15,
                  );
                },
                      ),
                    ),
              ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(text: 'TOTAL',fontsize: 12,color: Colors.grey,),
                    SizedBox(height: 15,),
                    CustomText(text: '\$2000',fontsize: 18,color: primaryColor,),
                  ],
                )
             ,Container(height: 90,width: 170, padding: EdgeInsets.all(20), child: CoustomButtonSgin(onPressed:(){} ,text: 'CHECKOUT',))
              ],
            ),
          )
            ],
          )),
    );
  }
}
