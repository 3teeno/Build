import 'package:flutter/material.dart';
import'Model_Products.dart';


class New_Product_Page extends StatefulWidget {
  const New_Product_Page({Key key}) : super(key: key);

  @override
  State<New_Product_Page> createState() => _New_Product_PageState();
}

class _New_Product_PageState extends State<New_Product_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product"),
      backgroundColor: Colors.lightBlue,),
    );
  }
}
