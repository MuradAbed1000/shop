import 'package:ecommerceend/core/view_model/auth_view_model.dart';
import 'package:ecommerceend/core/view_model/control_view_model.dart';
import 'package:ecommerceend/core/view_model/control_view_model.dart';
import 'package:ecommerceend/view/Cart/cart_view.dart';
import 'package:ecommerceend/view/Home/home_view.dart';
import 'package:ecommerceend/view/auth/login_View.dart';
import 'package:ecommerceend/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  Widget currentScreen = HomeView();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
            builder:(controller)=> Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
          );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Container(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Explore"),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    CircleAvatar(
                      maxRadius: 2,
                      backgroundColor: Colors.black,
                    )
                  ],
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Container(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text("Cart"),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    CircleAvatar(
                      maxRadius: 2,
                      backgroundColor: Colors.black,
                    )
                  ],
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_Cart.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Container(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text("Account"),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    CircleAvatar(
                      maxRadius: 2,
                      backgroundColor: Colors.black,
                    )
                  ],
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_User.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ))
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
          
        },
      ),
    );
  }
}
