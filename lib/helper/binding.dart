import 'package:ecommerceend/core/view_model/auth_view_model.dart';
import 'package:ecommerceend/core/view_model/control_view_model.dart';
import 'package:ecommerceend/core/view_model/control_view_model.dart';
import 'package:ecommerceend/core/view_model/home_view_model.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
  }
}
