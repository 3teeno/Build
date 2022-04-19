import 'package:flutter/material.dart';


class Update_Product_Page extends StatefulWidget {
  const Update_Product_Page({Key key}) : super(key: key);

  @override
  State<Update_Product_Page> createState() => _Update_Product_PageState();
}

class _Update_Product_PageState extends State<Update_Product_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("Update Product"),
      backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
