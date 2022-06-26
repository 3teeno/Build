import 'dart:math';

import 'package:build_i_t/all_market_places/singleCardDesign.dart';
import 'package:build_i_t/backend/backend.dart';
import 'package:build_i_t/home_page/marketPlaceCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Products/Model_Products.dart';
import '../data.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
List<Products> products = [];


void initState() {
initialise();


}
bool x=true;

List my_products = [];
Future<void> initialise() async {
  await Products.fetch_product().then((value)   {
    my_products = value;
    print(value);
    for (var i = 0; i < my_products.length; i++) {
      Products temp = Products(
        Product_Hash: my_products[i]['Product_Hash'],
        Product_Title: my_products[i]['Product_Title'],
        Product_Description: my_products[i]['Product_Description'],
        Product_Quantity: my_products[i]['Product_Quantity'],
        Product_Price: my_products[i]['Product_Price'],
        Product_Vendor_id: my_products[i]['Product_Vendor_id'],
      );
      products.add(temp);
      print("Products");
    }
  });
  print("Maa aa gaya");
  //print(my_products);
  if (my_products.isEmpty) {
    print("Empty Products Against Vendor");
  }}



class DataSearch extends SearchDelegate<String> {


  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    print(products);
    //initialise();
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
    //initialise();
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
if(x==true){
  initialise();
  x=false;
}


    print("vlaue:"+products.length.toString());
    List data=[];
    for (int i=1;i<products.length;i++){
      data.add(products[i].Product_Title);
    }
    final list=query.isEmpty? data:data.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();
//print("length: "+list.length.toString());
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => marketPlaceCard(
            title: list[index].toString(),
            imageUrl:
            "https://images.pexels.com/photos/159306/construction-site-build-construction-work-159306.jpeg?cs=srgb&dl=pexels-pixabay-159306.jpg&fm=jpg",
            price: products[index].Product_Price,
            quantity: products[index].Product_Quantity,
            context: context,
            description: products[index].Product_Description.toString()));
    //throw UnimplementedError();
  }

  // Future<List> querySnapShot() async {
  //   List docs = [];
  //   await FirebaseFirestore.instance
  //       .collection('products')
  //       .get()
  //       .then((value) => {
  //             print(value.docs.first.data()),
  //             value.docs.toList().forEach((doc) {
  //               print(doc.data());
  //               Map my_products = {
  //                 "Product_Hash": doc['Product_Hash'],
  //                 "Product_Title": doc['Product_Title'],
  //                 "Product_Description": doc['Product_Description'],
  //                 "Product_Quantity": doc['Product_Quantity'],
  //                 "Product_Price": doc['Product_Price'],
  //                 "Product_Vendor_id": doc['Product_Vendor_id'],
  //                 "Product_Category": doc['Product_Category'],
  //                 "Product_Images": doc['Product_Images'],
  //               };
  //               docs.add(my_products);
  //               print(docs);
  //             })
  //           });
  //   return docs;
  // }
}
