import 'dart:math';

import 'package:build_i_t/Orders/Order_Page_Customer.dart';
import 'package:build_i_t/Payments/Payments_Page.dart';
import 'package:build_i_t/home_page/CustomerHomePage.dart';
import 'package:flutter/material.dart';
import 'Model_Orders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_widgets.dart';

String hash;
String Ordertitle, Orderdescription, orderDuration, orderPrice;
final scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class add_OrderFireBase extends StatefulWidget {
  const add_OrderFireBase({Key key, hashCode}) : super(key: key);

  @override
  State<add_OrderFireBase> createState() => _add_OrderFireBaseState(hashCode);
}

class _add_OrderFireBaseState extends State<add_OrderFireBase> {
  _add_OrderFireBaseState(hashCode) {
    hash = hashCode.toString();
  }

  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _DurationController = TextEditingController();
  final TextEditingController _PriceController = TextEditingController();
  final TextEditingController _TitleController = TextEditingController();
  final TextEditingController _TransectionID = TextEditingController();
  final TextEditingController _HashController = TextEditingController();
  Order myorder;
  bool istransectionId = false;
  @override
  Widget build(BuildContext context) {
    String new_hash;

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePageWidget())),icon: Icon(Icons.arrow_back),),
          title: Text("Add Order"),
          backgroundColor: Color(0xFF115ba6),
        ),
        backgroundColor: Color(0xFFffffff),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormArea(
                orderTitle: "title here",
                orderDiscription: "Description here",
                orderDuration: "Duration here",
                orderPrice: "Price here",
                new_hash: new_hash)
          ],
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Transection Details'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _TransectionID,
            obscureText: false,
            validator: (value) {
              if (value = null) {
                return "please enter transection ID";
              }
            },
            decoration: InputDecoration(
              labelText: "Transection ID",
              labelStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: Color(0xFF282828),
              ),
              hintText: '1234....',
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
          SizedBox(
            height: 8,
          ),
          // InkWell(
          //   onTap: () {
          //     //yaha par cheema na uplod image ka code karna
          //
          //
          //   },
          //   child: Container(
          //     child: Center(child: Text("Uplaod Image",style: TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold),)),
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height * 0.07,
          //     decoration: BoxDecoration(color: Color(0xFF123456)),
          //   ),
          // )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            if (_TransectionID.text != null) {
              setState(() {
                istransectionId = true;
              });
            }
            Navigator.of(context).pop();
          },
          textColor: Color(0xFF123456),
          child: const Text('Close',style: TextStyle(fontSize: 15),),
        ),
      ],
    );
  }

  Widget TextFormArea(
      {String orderTitle,
      String orderDiscription,
      String orderDuration,
      String orderPrice,
      String new_hash}) {
    Random random = new Random();
    int random_hash = random.nextInt(9999) + 999;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _TitleController,
              obscureText: false,
              validator: (value) {
                if (value = null) {
                  return "please enter order title";
                }
              },
              decoration: InputDecoration(
                labelText: "Order Title",
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
            SizedBox(
              width: 50.0,
              height: 10.0,
            ),
            TextFormField(
              controller: _DescriptionController,
              obscureText: false,
              validator: (value) {
                if (value = null) {
                  return "please enter order discription";
                }
              },
              decoration: InputDecoration(
                labelText: "Order Discription",
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
            SizedBox(
              width: 50.0,
              height: 10.0,
            ),
            TextFormField(
              controller: _DurationController,
              obscureText: false,
              validator: (value) {
                if (value = null) {
                  return "please enter order duration";
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Order Duration (1 - 10 Days)",
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
            SizedBox(
              width: 50.0,
              height: 10.0,
            ),
            TextFormField(
              validator: (value) {
                if (value = null) {
                  return "please enter order price";
                }
              },
              controller: _PriceController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: "Order Price (PKR)",
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
            SizedBox(
              width: 50.0,
              height: 10.0,
            ),
            //Update Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: Color(0xFF115ba6),
                onPressed: () {
                  if (_DescriptionController.text.isEmpty &&
                      _DurationController.text.isEmpty &&
                      _DurationController.text.isEmpty &&
                      _PriceController.text.isEmpty &&
                      _TitleController.text.toString() != null) {
                    scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text("Please fill all fields first!")));
                  } else {
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) =>
                    //       _buildPopupDialog(context),
                    // );
                    if (int.parse(_DurationController.text) > 0 &&
                        int.parse(_DurationController.text) <= 10) {
                      random_hash = random.nextInt(9999) + 999;
                      new_hash = random_hash.toString();
                      Order.add_order(
                        Order_Description:
                            _DescriptionController.text.toString(),
                        Order_Duration: _DurationController.text.toString(),
                        Order_Hash: new_hash.toString(),
                        Order_Vendor_id: user.uid.toString(),
                        Order_Price: _PriceController.text.toString(),
                        Order_Title: _TitleController.text.toString(),



                      );
                      print("Add Orders Pressed");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Payments_Page(price: _PriceController.value.text,)));
                    } else {
                      _DurationController.clear();
                      scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                              "Please enter duration between 1 - 10 Days")));
                    }
                  }
                  //Pop Up
                },
                child: Text(
                  "Add Order",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
