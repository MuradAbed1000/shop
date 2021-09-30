import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceend/core/services/home_service.dart';
import 'package:ecommerceend/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];
  HomeViewModel() {
    getCategory();
  }
  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(
            value[i].data() as Map<dynamic, dynamic>));
        print(_categoryModel.length);
         _loading.value = false;
      }
      update();
    });
  }
}
