import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final CollectionReference _mainCollection = _firestore.collection('users');

class Person {
  String user_id;
  String user_displayname;
  String user_email;
  String user_password;
  String user_type; //Customer , Vendor , Admin

  Person(this.user_id,this.user_displayname,this.user_email,this.user_password,this.user_type)
  {
    this.user_email = user_email;
    this.user_id=user_id;
    this.user_password=user_password;
    this.user_displayname=user_displayname;
    this.user_type=user_type;
  }
  Future<void>New_Person()
  {

  }
  Future<void>Update_Person()
  {

  }
  Future<void>Delete_Person()
  {

  }

}

