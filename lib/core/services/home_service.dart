  
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categorycollectionReference =
      FirebaseFirestore.instance.collection("Categories");


  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categorycollectionReference.get();
    return value.docs;
  }
}
