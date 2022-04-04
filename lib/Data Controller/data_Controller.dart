import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  final firebaseInstance = FirebaseFirestore.instance;
  Map data = {'Name': '', 'Email': '','Contact':'','Image':''};


  final FirebaseAuth auth = FirebaseAuth.instance;


  void onReady() {
    super.onReady();
    getUserData();
  }
  Future<void> getUserData() async {
    // print("user id ${authController.userId}");
    try {
      var response = await firebaseInstance
          .collection('Vendor')
          .where('uid', isEqualTo: auth.currentUser)
          .get();
      // response.docs.forEach((result) {
      //   print(result.data());
      // });
      if (response.docs.length > 0) {
        data['Name'] = response.docs[0]['Name'];
        data['Email'] = response.docs[0]['Email'];
        data['Contact'] = response.docs[0]['Contact'];
        data['Image'] = response.docs[0]['Image'];
      }
      Fluttertoast.showToast(msg: "hollaa");
      print(data);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }


}