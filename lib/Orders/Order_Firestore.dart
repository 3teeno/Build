import 'dart:math';

import 'package:build_i_t/Orders/Order_Page_Customer.dart';
import 'package:flutter/material.dart';
import 'Model_Orders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_widgets.dart';
import 'Active_Orders.dart';

class Order_Firestore_CRUDS extends StatefulWidget {
  const Order_Firestore_CRUDS({Key key}) : super(key: key);

  @override
  State<Order_Firestore_CRUDS> createState() => _Order_Firestore_CRUDSState();
}

class _Order_Firestore_CRUDSState extends State<Order_Firestore_CRUDS> {

final TextEditingController _DescriptionController = TextEditingController();
final TextEditingController _DurationController = TextEditingController();
final TextEditingController _PriceController = TextEditingController();
final TextEditingController _TitleController = TextEditingController();
final TextEditingController _VendoridController = TextEditingController();
final TextEditingController _HashController = TextEditingController();
Order myorder;
@override
  Widget build(BuildContext context) {
    String new_hash;
    Random random = new Random();
    int random_hash = random.nextInt(9999)+999;
    return Scaffold(
      appBar: AppBar(title: Text("Order CRUDS"),),
      backgroundColor: Colors.blue[200],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(onPressed: () => {
                random_hash = random.nextInt(9999)+999,
                new_hash = random_hash.toString(),
                Order.add_order(
                  Order_Description: _DescriptionController.text.toString(),
                  Order_Duration: _DurationController.text.toString(),
                  Order_Hash: new_hash.toString(),
                  Order_Vendor_id: user.uid.toString(),
                  Order_Price: _PriceController.text.toString(),
                  Order_Title: _TitleController.text.toString(),
                ),
                print("Add Orders Pressed"),

              }, child: Text("Add"),style: ButtonStyle( backgroundColor:MaterialStateProperty.all<Color>(Colors.white),minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),),
              SizedBox(width: 50.0, height: 10.0,),
              TextButton(onPressed: () => {
                Order.update_order(
                  Order_Description: _DescriptionController.text.toString(),
                  Order_Duration: _DurationController.text.toString(),
                  Order_Hash: new_hash.toString(),
                  Order_Vendor_id: user.uid.toString(),
                  Order_Price: _PriceController.text.toString(),
                  Order_Title: _TitleController.text.toString(),
                ),
                print("Update Orders Pressed")
              }, child: Text("Update"),style: ButtonStyle( backgroundColor:MaterialStateProperty.all<Color>(Colors.white),minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),),
              SizedBox(width: 50.0, height: 10.0,),
              TextButton(onPressed: () => {print("Delete Orders Pressed")}, child: Text("Delete"),style: ButtonStyle( backgroundColor:MaterialStateProperty.all<Color>(Colors.white),minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),),
              SizedBox(width: 50.0, height: 10.0,),
              TextButton(onPressed: () => {

                print("Fetch Orders Pressed"),
                // Order.fetch_order().then
                //   ((value) => setState((){ docs=value; } ) ),
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Order_Page_Customer(),
                  ),)
                // print("Checking the final final"),
                // print(docs),
              },
                child: Text("Fetch My Orders"),style: ButtonStyle( backgroundColor:MaterialStateProperty.all<Color>(Colors.white),minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),),

              SizedBox(width: 50.0, height: 10.0,),
              TextFormField(

                controller: _TitleController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Order Title',
                  labelStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  hintText: 'I will do this for you....',
                  hintStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF282828),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF282828),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF282828),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(width: 50.0, height: 10.0,),
              TextFormField(
                controller: _DescriptionController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Order Description',
                  labelStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  hintText: 'Add your Description Here',
                  hintStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF282828),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF282828),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF282828),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(width: 50.0, height: 10.0,),
              TextFormField(
                controller: _DurationController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Order Duration',
                  labelStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  hintText: '3 Days',
                  hintStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF282828),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF282828),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF282828),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(width: 50.0, height: 10.0,),
              TextFormField(

                controller: _PriceController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Order Price',
                  labelStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  hintText: 'PKR 500',
                  hintStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF282828),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF282828),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF282828),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(width: 50.0, height: 10.0,),
            ],
          ),

        ),
      ),
    );
  }
}


