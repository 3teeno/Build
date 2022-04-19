import 'dart:collection';

import 'package:build_i_t/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final CollectionReference _mainCollection = _firestore.collection('products');

class Products {
  String Product_Hash;
  String Product_Title;
  String Product_Description;
  String Product_Quantity;
  String Product_Price;
  String Product_Vendor_id; //Currently Used as Userid
  String Product_Category;
  String Product_Images;

   static Future<void> add_product({String Product_Hash,String Product_Title,String Product_Description,String Product_Price,String Product_Quantity,String Product_Vendor_id,String Product_Category,String Product_Images}) async
  {
    DocumentReference documentReferencer = _mainCollection.doc();
    Map<String, dynamic> data = <String, dynamic>{
      "Product_Hash" : Product_Hash,
      "Product_Title": Product_Title,
      "Product_Description": Product_Description,
      "Product_Quantity": Product_Quantity,
      "Product_Price": Product_Price,
      "Product_Vendor_id": Product_Vendor_id,
      "Product_Category":Product_Category,
      "Product_Images": Product_Images,
    };
    await documentReferencer
        .set(data)
        .whenComplete(() => print("New Product added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> update_product({String Product_Hash,String Product_Title,String Product_Description,String Product_Price,String Product_Quantity,String Product_Vendor_id,String Product_Category,String Product_Images}) async
  {
    QuerySnapshot querySnapshot = await _mainCollection.get();
    // Query query = await _mainCollection
    // querySnapshot.docs.where((element) => false)
    // final doc_ref = querySnapshot.docs.map((doc) => doc.reference.id);
    // print("MY Reference Id is : ");
    // print(doc_ref);

    // final FirebaseFirestore find_data = _firestore.collection("orders").where("Order_Hash",isEqualTo:"123456").snapshots().listen(
    //         (data) => print('grower ${data.docs[0]['Order_Hash']}')) as FirebaseFirestore ;

    Query query = await _mainCollection.where('Order_Hash',isEqualTo: '9999');
    query.get().then((querySnapshot) => { querySnapshot.docs.forEach((element) {
      print(element.reference.id);})
    });

    DocumentReference documentReferencer = _mainCollection.doc();
    Map<String, dynamic> data = <String, dynamic>{
      // "Product_Hash" : Product_Hash,  # Not Needed to Update. Fixed Value
      "Product_Title": Product_Title,
      "Product_Description": Product_Description,
      "Product_Quantity": Product_Quantity,
      "Product_Price": Product_Price,
      // "Product_Vendor_id": Product_Vendor_id, # Not Needed to Update. Fixed Value
      "Product_Category":Product_Category,
      "Product_Images": Product_Images,
    };
    await documentReferencer
        .update(data)
        .whenComplete(() => print("Updated product to the database"))
        .catchError((e) => print(e));
  }

  static Future<List> fetch_product() async
  {
    QuerySnapshot querySnapshot;
    List docs=[];
    print("Tryna Fetch");
    try {
      Query query = await _mainCollection.where(
          'Product_Vendor_id', isEqualTo: user.uid);
      query.get().then((querySnapshot) =>
      {
        querySnapshot.docs.toList().forEach((doc) {
          // print(doc['Order_Hash']);
          Map my_orders = {
            "Product_Hash" : doc['Product_Hash'],
            "Product_Title": doc['Product_Title'],
            "Product_Description": doc['Product_Description'],
            "Product_Quantity": doc['Product_Quantity'],
            "Product_Price": doc['Product_Price'],
            "Product_Vendor_id": doc['Product_Vendor_id'],
            "Product_Category":doc['Product_Category'],
            "Product_Images": doc['Product_Images'],
          };
          docs.add(my_orders);
          // print(my_orders);
        })
      });
      return docs;
    }
    catch (e) {
      print(e);
    }
  }
}







