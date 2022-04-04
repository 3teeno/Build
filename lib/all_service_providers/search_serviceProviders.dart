// import 'package:build_i_t/all_market_places/singleCardDesign.dart';
import 'dart:math';

import 'package:build_i_t/home_page/serviceProvidersCard.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class search_serviceProviders extends SearchDelegate<String>{
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6EFDE),
          elevation: 0,
          foregroundColor: Colors.black,

        ),
        inputDecorationTheme: new InputDecorationTheme(
            border: InputBorder.none
        )
    );
  }
  Data data1=new Data();
  Random random=new Random();
  double ratingValue;
  search_serviceProviders(double ratingV){
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
    final data=data1.chatnames();
    final list=query.isEmpty? data:data.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();
    print(data);
    return GridView.count(crossAxisCount: 2,children: List.generate(list.length, (index) =>
        serviceProvidersCard(context,

            serviceName: list[index],
            )));
    throw UnimplementedError();
  }

}