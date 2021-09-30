// ignore_for_file: file_names
import 'package:ecommerceend/core/view_model/auth_view_model.dart';
import 'package:ecommerceend/view/auth/login_View.dart';
import 'package:ecommerceend/view/widget/Coustom_Button_sgin.dart';
import 'package:ecommerceend/view/widget/custom_text.dart';
import 'package:ecommerceend/view/widget/custom_text_from_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegesterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.off(LoginView());
            },
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black87,
              size: 25,
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 16, top: 60, right: 16, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: "Sign Up",
                          color: Colors.black,
                          fontsize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                CustomTextFromFiled(
                                  text: 'Name',
                                  hit: 'Murad Abed',
                                  onSaved: (value) {
                                    controller.name = value;
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      print("Error");
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                CustomTextFromFiled(
                                  text: 'Email',
                                  hit: 'iamdavid@gmail.com',
                                  onSaved: (value) {
                                    controller.email = value;
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      print("Error");
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                CustomTextFromFiled(
                                  text: 'Password',
                                  hit: '*********',
                                  onSaved: (value) {
                                    controller.password = value;
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      print("Error");
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                CoustomButtonSgin(
                                  text: 'SIGN UP',
                                  fontsize: 18,
                                  color: Colors.green,
                                  alignment: Alignment.center,
                                  onPressed: () {
                                    _formKey.currentState!.save();
                                    if (_formKey.currentState!.validate()) {
                                      controller.EmailAndPasswordSignUpMethod();
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
