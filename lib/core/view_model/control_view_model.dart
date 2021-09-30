import 'package:ecommerceend/core/services/home_service.dart';
import 'package:ecommerceend/model/category_model.dart';
import 'package:ecommerceend/model/porduct_model.dart';
import 'package:ecommerceend/view/Cart/cart_view.dart';
import 'package:ecommerceend/view/Home/home_view.dart';
import 'package:ecommerceend/view/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;
  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;
  void changeSelectedValue(int SelectedValue) {
    _navigatorValue = SelectedValue;
    switch (SelectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
        }
        break;
      case 1:
        {
          _currentScreen = CartView();
        }
        break;
      case 2:
        {
          _currentScreen = ProfileView();
        }
        break;
      default:
        {
          _currentScreen = HomeView();
        }break;
    }
    update();
  }
}
