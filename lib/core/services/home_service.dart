  
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categorycollectionReference =
      FirebaseFirestore.instance.collection("Categories");
      final CollectionReference _productscollectionReference =
      FirebaseFirestore.instance.collection("Products");


  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categorycollectionReference.get();
    return value.docs;
  }
   Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productscollectionReference.get();
    return value.docs;
  }
}
