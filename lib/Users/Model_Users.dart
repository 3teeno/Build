
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;

final CollectionReference _mainCollection = _firestore.collection('users');

class Users {

  String users_name;
  String users_id;
  String users_email;
  String users_phone;
  String users_role;

  Users({this.users_name,this.users_role,this.users_email,this.users_phone,this.users_id})
  {
    this.users_email=users_email;
    this.users_phone=users_phone;
    this.users_role=users_role;
    this.users_name=users_name;
    this.users_id=users_id;
  }
  static Future<List> fetch_vendors() async
  {
    QuerySnapshot querySnapshot;
    List docs=[];
    print("Fetching From Firestore");
    try {
      Query query = await _mainCollection.where('userRole', isEqualTo: 'Vendor');
      await query.get().then((querySnapshot) =>
      {
        querySnapshot.docs.toList().forEach((doc) {
          Map my_users = {
            "users_id": doc['uid'],
            "users_email": doc['email'],
            "users_role": doc['userRole'],
            "users_phone": doc['phone'],
            "users_name": doc['displayName'],
          };
          print(docs);
          docs.add(my_users);
        })
      });
      return docs;
    }
    catch (e) {
      print(e);
    }
  }
}