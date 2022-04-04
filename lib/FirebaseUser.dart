import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> addUserData(String Type,String FullName,String Phone)
{
  Fluttertoast.showToast(msg: "Adding user to "+Type);
  CollectionReference users=FirebaseFirestore.instance.collection(Type);


  FirebaseAuth auth = FirebaseAuth.instance;
  String uid=auth.currentUser.uid.toString();
  DocumentReference documentReferencer = users.doc(uid);
  documentReferencer.set({"FullName":FullName,"PhoneNo":Phone,"uid":uid})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));;
  return null;
}