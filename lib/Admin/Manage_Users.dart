import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth/firebase_user_provider.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final CollectionReference _mainCollection = _firestore.collection('users');


class Manage_Users extends StatefulWidget {
  const Manage_Users({Key key}) : super(key: key);

  @override
  State<Manage_Users> createState() => _Manage_UsersState();
}

class _Manage_UsersState extends State<Manage_Users> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}





