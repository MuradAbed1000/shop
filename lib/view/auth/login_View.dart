// ignore_for_file: file_names
import 'package:ecommerceend/constance.dart';
import 'package:ecommerceend/core/view_model/auth_view_model.dart';
import 'package:ecommerceend/view/widget/Coustom_Button_sgin.dart';
import 'package:ecommerceend/view/widget/custom_button_social.dart';
import 'package:ecommerceend/view/widget/custom_text.dart';
import 'package:ecommerceend/view/widget/custom_text_from_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'regester_View.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 16, top: 100, right: 16, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 16, right: 16),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Welcome,",
                                  color: Colors.black,
                                  fontsize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  onTap: () {
                                    Get.to(RegesterView());
                                  },
                                  text: "Sign Up",
                                  fontsize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            //End Row Welcome And SginUp loginScreen
                            CustomText(
                              text: 'Sign in to Continue',
                              alignment: Alignment.topLeft,
                              fontsize: 14,
                              color: Color.fromRGBO(146, 146, 146, 1),
                            ),

                            const SizedBox(
                              height: 50,
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
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFromFiled(
                              text: 'Password',
                              hit: '***********',
                              onSaved: (value) {
                                controller.password = value;
                              },
                              validator: (value) {
                                if (value == null) {
                                  print("Error");
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              text: 'Forget Password?',
                              fontsize: 14,
                              alignment: Alignment.topRight,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CoustomButtonSgin(
                              alignment: Alignment.center,
                              color: primaryColor,
                              fontsize: 20,
                              text: 'SIGN IN',
                              onPressed: () {
                                _formKey.currentState!.save();
                                if (_formKey.currentState!.validate()) {
                                  controller.EmailAndPasswordSignInMethod();
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CustomText(
                  text: '-OR-',
                  fontsize: 20,
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 20),
                  child: CustomButtonSocial(
                    textassets: 'assets/images/facebook.png',
                    text: 'Sgin in with Facebook',
                    borderradius: 10,
                    height: 40,
                    width: 40,
                    onPressed: () {
                      controller.FacebookSignInMethod();
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
                  child: CustomButtonSocial(
                      textassets: 'assets/images/google.png',
                      text: 'Sgin in with Google',
                      borderradius: 10,
                      height: 40,
                      width: 40,
                      onPressed: () {
                        controller.GoogleSignInMethod();
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
