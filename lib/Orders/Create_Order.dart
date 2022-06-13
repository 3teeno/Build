import 'package:build_i_t/MenuBar/menubar_customer.dart';
import 'package:build_i_t/Vendor_Services/Model_Services.dart';
import 'package:build_i_t/all_market_places/Search_Material.dart';
import 'package:build_i_t/all_service_providers/search_serviceProviders.dart';
import 'package:build_i_t/home_page/serviceProvidersCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Products/Model_Products.dart';
import '../backend/schema/users_record.dart';
import '../chat_details/chat_details_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:build_i_t/data.dart';
import 'dart:math';


class CreateOrder extends StatefulWidget {
  const CreateOrder({Key key,this.Product}) : super(key: key);
  final Products Product;
  @override
  _CreateOrder createState() => _CreateOrder();
}

class _CreateOrder extends State<CreateOrder> {



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
                Text("Paisa 03015207003 pa send kr do aur transaction ID aur date neecha bhar do"),
                TextButton(onPressed: () async {
                  const snackBar = SnackBar(
                    content: Text('IDR show krwana ka ustad jab vendor approve kara ga order tu tujhe notification aa jai ge'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

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
                }, style: ButtonStyle(),child: Text("Submit details"),
                ),
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
                }, style: ButtonStyle(),child: Text("Create order user"),
                )
              ],
            ),
          );
        });
  }
}
