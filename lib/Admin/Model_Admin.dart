
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;

final CollectionReference _mainCollection = _firestore.collection('admin');


class Admin {
  String name;
  String userid;


}