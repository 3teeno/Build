import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth/firebase_user_provider.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final CollectionReference _mainCollection = _firestore.collection('payments');


class Manage_Payments extends StatefulWidget {
  const Manage_Payments({Key key}) : super(key: key);

  @override
  State<Manage_Payments> createState() => _Manage_PaymentsState();
}

class _Manage_PaymentsState extends State<Manage_Payments> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

