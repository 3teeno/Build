import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;

Future<List<dynamic>> getCollection(CollectionReference collection) async {
  try {
    QuerySnapshot snapshot = await collection.get();
    List<dynamic> result =  snapshot.docs.map((doc) => doc.data()).toList();
    return result;
  } catch (error) {
    print(error);
    return null;
  }
}
final CollectionReference _mainCollection = _firestore.collection('Services');

class Database {
  static String userUid;
  static Future<void> addItem({String Service_Name, String Service_Description, String Service_HourlyRate, String Service_Category,}) async {
    DocumentReference documentReferencer = _mainCollection.doc();
    Map<String, dynamic> data = <String, dynamic>{
      "S_Name": Service_Name,
      "S_Description": Service_Description,
      "S_HourlyRate": Service_HourlyRate,
      "S_Category": Service_Category,
      "S_uid":user.uid,
    };
    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    String Service_Name,
    String Service_Description,
    String Service_HourlyRate,
    String Service_Category,
  }) async {

    QuerySnapshot query_update = await _mainCollection.get();
    final doc_ref = query_update.docs.map((doc) => doc.reference.id);
    print(doc_ref);
    List list_docs = doc_ref.toList();
    var mydoc = list_docs[0];

    // final FirebaseFirestore find_data =  _firestore.collection("Vendor_Services").where('S_uid',isEqualTo: user.uid).
    // snapshots().listen(
    // (data) => print('grower ${data.docs[0]['S_uid']}')) as FirebaseFirestore;
    DocumentReference documentReferencer = _mainCollection.doc(mydoc);
    Map<String, dynamic> data = <String, dynamic>{
      "S_Name": Service_Name,
      "S_Description": Service_Description,
      "S_HourlyRate": Service_HourlyRate,
      "S_Category": Service_Category,
      "S_uid":user.uid,
    };
    await documentReferencer
        .update(data)
        .whenComplete(() => print("Notes updated to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({
    String docId,
  }) async {

    QuerySnapshot query_update = await _mainCollection.get();
    final doc_ref = query_update.docs.map((doc) => doc.reference.id);
    print(doc_ref);
    List list_docs = doc_ref.toList();
    var mydoc = list_docs[0];
    DocumentReference documentReferencer = _mainCollection.doc(mydoc);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }

  static Future<List> receiveData() async {

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _mainCollection.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);
    //Idhar Aja
    // List MyVendorsLists = allData;
    // print(MyVendorsLists[0]);
    // print(MyVendorsLists);
    return allData ;
  }

}