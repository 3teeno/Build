import 'package:build_i_t/MenuBar/menubar_customer.dart';
import 'package:build_i_t/Orders/Order_Firestore_add.dart';
import 'package:build_i_t/Vendor_Services/Model_Services.dart';
import 'package:build_i_t/all_market_places/Search_Material.dart';
import 'package:build_i_t/all_service_providers/search_serviceProviders.dart';
import 'package:build_i_t/home_page/serviceProvidersCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../backend/schema/users_record.dart';
import '../chat_details/chat_details_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:build_i_t/data.dart';
import 'dart:math';

import 'Model_Products.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key key,this.Product}) : super(key: key);
  final Products Product;
  @override
  _ProductPage createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {



  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final userdata = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.Product.Product_Vendor_id);
    return StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(userdata),
    builder: (context, snapshot) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Text("IDR Furqan na data dalna hai using Product ka object "+widget.Product.Product_Title),
          TextButton(onPressed: () async {
            final userdata = FirebaseFirestore.instance
                .collection('users')
                .doc(widget.Product.Product_Vendor_id);
            var ref = UsersRecord.getDocument(userdata);
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.scale,
                alignment: Alignment.bottomCenter,
                duration: Duration(milliseconds: 300),
                reverseDuration: Duration(milliseconds: 300),
                child: ChatDetailsWidget(
                  chatUser: snapshot.data,
                ),
              ),
            );
          }, style: ButtonStyle(),child: Text("Chat with user"),
          ),
          TextButton(onPressed: () async {
            await Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      add_OrderFireBase(
                        hashCode: widget.Product.Product_Hash,
                      ),
                ));

          }, style: ButtonStyle(),child: Text("Create order user"),
          )
        ],
      ),
    );
  });
  }
}
