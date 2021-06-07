

import 'package:artlar/models/Categories.dart';
import 'package:artlar/models/Product.dart';
import 'package:artlar/models/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  

  Stream<List<Product>> getProducts(){
    return _db.collection('product').snapshots().map((snapshot) => snapshot.docs.map((document) => Product.fromFirestore(document.data())).toList());
  }

  Stream<List<Category>> getCategory(){
    return _db.collection('category').snapshots().map((snapshot) => snapshot.docs.map((document) => Category.fromFirestore(document.data())).toList());
  }


  
}