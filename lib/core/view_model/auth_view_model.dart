import 'package:ecommerceend/core/services/fire_store_users.dart';
import 'package:ecommerceend/model/user_model.dart';
import 'package:ecommerceend/view/Home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSginIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? email, password, name;
  final Rxn<User?> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void GoogleSignInMethod() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSginIn.signIn();
      print(googleUser);
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await _auth
          .signInWithCredential(credential)
          .then((user) => saveUser(user));
      Get.offAll(HomeView());
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error login account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }

    update();
  }

  void FacebookSignInMethod() async {
    try {
      final LoginResult? result =
          await FacebookAuth.instance.login(permissions: ['email']);
      final accessToken = result!.accessToken!.token;
      if (result.status == LoginStatus.success) {
        final faceCredential = FacebookAuthProvider.credential(accessToken);
        print(faceCredential);
        await _auth
            .signInWithCredential(faceCredential)
            .then((user) => saveUser(user));

        Get.offAll(HomeView());
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error login account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }

    update();
  }

  void EmailAndPasswordSignInMethod() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) => print(value));
      Get.offAll(HomeView());
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error login account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }

    update();
  }

  void EmailAndPasswordSignUpMethod() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) => saveUser(user));
      Get.offAll(HomeView());
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error login account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }

    update();
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
        userId: user.user!.uid,
        email: user.user!.email,
        name: name == null ?user.user!.displayName :name,
        pic: '');
    await FireStoreUsers().addUserToFireStor(userModel);
  }
}
