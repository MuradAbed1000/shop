import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceend/model/user_model.dart';
import 'package:flutter/material.dart';

class FireStoreUsers {
  final CollectionReference _userColectionRef =
      FirebaseFirestore.instance.collection('Users');
  Future<void> addUserToFireStor(UserModel userModel) async {
    return await _userColectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
