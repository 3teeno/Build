import 'dart:collection';
import 'dart:math';

import 'package:build_i_t/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../auth/firebase_user_provider.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;

final CollectionReference _mainCollection = _firestore.collection('orders');


class Order {

  String Order_Hash;
  String Order_Title;
  String Order_Description;
  String Order_Duration;
  String Order_Price;
  String Order_Vendor_id; //Currently Used as Userid
  String Order_Status;
  String Order_Customer_id;

  Order({this.Order_Hash, this.Order_Title, this.Order_Description, this.Order_Duration, this.Order_Price, this.Order_Vendor_id,this.Order_Status }) {
    this.Order_Hash = Order_Hash;
    this.Order_Title = Order_Title;
    this.Order_Price = Order_Price;
    this.Order_Duration = Order_Duration;
    this.Order_Description = Order_Description;
    this.Order_Vendor_id = user.uid;
    this.Order_Customer_id = user.uid;
    this.Order_Status= Order_Status;
  }
  static Future<void> add_order({String Order_Hash,String Order_Vendor_id, String Order_Title, String Order_Description, String Order_Duration, String Order_Price}) async
  {
    DocumentReference documentReferencer = _mainCollection.doc();
    Map<String, dynamic> data = <String, dynamic>{
      "Order_Hash" : Order_Hash,
      "Order_Title": Order_Title,
      "Order_Description": Order_Description,
      "Order_Duration": Order_Duration,
      "Order_Price": Order_Price,
      "Order_Vendor_id": Order_Vendor_id,
      "Order_Status":'Active',
    };
    await documentReferencer
        .set(data)
        .whenComplete(() => print("New Order added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> update_order({String my_hash,String Order_Vendor_id, String Order_Title, String Order_Description, String Order_Duration, String Order_Price}) async
  {
    QuerySnapshot querySnapshot = await _mainCollection.get();
    Query query = await _mainCollection.where('Order_Hash',isEqualTo: my_hash);
    query.get().then((querySnapshot) => { querySnapshot.docs.forEach((element) {
      print(element.reference.id);})
    });

    DocumentReference documentReferencer = _mainCollection.doc();
    Map<String, dynamic> data = <String, dynamic>{
      "Order_Title": Order_Title,
      "Order_Description": Order_Description,
      "Order_Duration": Order_Duration,
      "Order_Type" : "Service",
      //"Order_User_id":user.uid
      // "Order_Hash" : Order_Hash, # Not Needed to Update. Fixed Value
      // "Order_Vendor_id":Order_Vendor_id, # Not Needed to Update. Fixed Value
    };
    await documentReferencer
        .update(data)
        .whenComplete(() => print("Updated data to the database"))
        .catchError((e) => print(e));
  }

  static Future<List> fetch_order() async
  {
    QuerySnapshot querySnapshot;
    List docs=[];
    print("Fetching From Firestore");
    try {
      Query query = await _mainCollection.where('Order_Vendor_id', isEqualTo: currentUser.user.uid);
      await query.get().then((querySnapshot) =>
      {
        querySnapshot.docs.toList().forEach((doc) {
          Map my_orders = {
            "Vendor_id": doc.id,
            "Order_Hash": doc['Order_Hash'],
            "Order_Title": doc['Order_Title'],
            "Order_Description": doc['Order_Description'],
            "Order_Duration": doc['Order_Duration'],
            "Order_Price": doc['Order_Price'],
            "Order_Status": doc['Order_Status'],
          };
          docs.add(my_orders);
        })
      });
      return docs;
    }
    catch (e) {
      print(e);
    }
  }
  static Future<List> delete_order(String my_hash) async
  {
    String doc_ref;
    Query query = await _mainCollection.where('Order_Hash', isEqualTo: my_hash);
    await query.get().then((querySnapshot) =>
    {
    querySnapshot.docs.toList().forEach((doc) {
      doc_ref=doc.reference.id.toString();
    })});
    DocumentReference documentReference = _mainCollection.doc(doc_ref);
    await documentReference.delete().whenComplete(() => print("Order Hash : "+my_hash+"item deleted from the database"))
    .catchError((e) => print(e));
    }

}



