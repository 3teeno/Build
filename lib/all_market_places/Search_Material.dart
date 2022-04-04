import 'dart:math';

import 'package:build_i_t/all_market_places/singleCardDesign.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class DataSearch extends SearchDelegate<String>{
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
  Random random =new Random();
  Data data=new Data();

  //List data1=data.chatnames().map((e) => e).toList();
  double ratingValue;
  DataSearch(double ratingV){
    ratingValue=ratingV;
  }
  @override
  List<Widget> buildActions(BuildContext context) {

    return [
      IconButton(onPressed: (){
        query="";
      }, icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
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
    List list1=data.chatnames();
    print(list1);
    final list=query.isEmpty? list1:list1.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();
    print(data);
    return ListView.builder(itemBuilder: (context,index)=>singleCard(
        context,
        ratingBarValue: ratingValue,
        ratingNo: random.nextInt(5).toDouble(),
        imageURL: data.imagesServices(),
        storeName: list[index],
        storLocation: "Loney Wala"
    ),
      itemCount: list.length,);
    throw UnimplementedError();
  }

}