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
          backgroundColor: Color(0xFF115ba6),
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        primaryColor: Color(0xFFffffff),
        hintColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme:
            new InputDecorationTheme(border: InputBorder.none));
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
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
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
    List list2 = data.chatnames();
    final list = query.isEmpty
        ? list2
        : list2
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    print(data);

    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => marketPlaceCard(
            title: list[index],
            imageUrl:
                'https://images.unsplash.com/photo-1541888946425-d81bb19240f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
            price: "PKR 500",
            quantity: "5",
            context: context,
            description: data.description()));
    throw UnimplementedError();
  }

  Future<List> querySnapShot() async {
    List docs = [];
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((value) => {
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
