import 'dart:math';

import 'package:build_i_t/all_market_places/singleCardDesign.dart';
import 'package:build_i_t/backend/backend.dart';
import 'package:build_i_t/home_page/marketPlaceCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;

class DataSearch extends SearchDelegate<String> {


  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6EFDE),
          elevation: 0,
          foregroundColor: Colors.black,

        ),
        primaryColor: Color(0xFFF6EFDE),
        inputDecorationTheme: new InputDecorationTheme(
            border: InputBorder.none
        )
    );
  }

  Random random = new Random();
  Data data = new Data();

  //List data1=data.chatnames().map((e) => e).toList();
  double ratingValue;

  DataSearch(double ratingV) {
    ratingValue = ratingV;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query = "";
      }, icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: Icon(
      Icons.arrow_back,

    ));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List list1;
    querySnapShot().then((value) => list1=value);
    print("Hello world");
    // if(list1.isNotEmpty)
    // list1.forEach((element) {
    //   list2.add(element['Product_Title']);
    // });
     print("DATA DA"+list1.toString());
     final list=query.isEmpty? list1:list1.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(itemBuilder: (context, index) => list1[index],itemCount: list1.length,);
    throw UnimplementedError();
  }

  Future<List> querySnapShot() async {
    List docs = [];
    await FirebaseFirestore.instance.collection('products').get().then((value) =>
    {
      print(value.docs.first.data()),
      value.docs.toList().forEach((doc) {
        print(doc.data());
        Map my_products = {
          "Product_Hash": doc['Product_Hash'],
          "Product_Title": doc['Product_Title'],
          "Product_Description": doc['Product_Description'],
          "Product_Quantity": doc['Product_Quantity'],
          "Product_Price": doc['Product_Price'],
          "Product_Vendor_id": doc['Product_Vendor_id'],
          "Product_Category": doc['Product_Category'],
          "Product_Images": doc['Product_Images'],
        };
        docs.add(my_products);
        print(docs);
      })

    });
    return docs;

  }
}