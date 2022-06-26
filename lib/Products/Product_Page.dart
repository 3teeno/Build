import 'dart:async';

import 'package:build_i_t/MenuBar/menubar_customer.dart';
import 'package:build_i_t/Orders/Order_Firestore_add.dart';
import 'package:build_i_t/Vendor_Services/Model_Services.dart';
import 'package:build_i_t/all_market_places/Search_Material.dart';
import 'package:build_i_t/all_service_providers/search_serviceProviders.dart';
import 'package:build_i_t/home_page/CustomerHomePage.dart';
import 'package:build_i_t/home_page/serviceProvidersCard.dart';
import 'package:build_i_t/market_place/Google_Maps.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  const ProductPage({Key key, this.Product}) : super(key: key);
  final Products Product;
  @override
  _ProductPage createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {
  void initState() {
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


  int x = 0;
  @override
  Widget build(BuildContext context) {
    final userdata = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.Product.Product_Vendor_id);
    return StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(userdata),
        builder: (context, snapshot) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(widget.Product.Product_Title),
                foregroundColor: Color(0xFF123456),
                backgroundColor: Color(0xFFFFFFFF),
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xFF123456),
                  ),
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePageWidget())),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        widget.Product.Product_Images,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                // width: MediaQuery.of(context).size.width*0.4,
                                // height: MediaQuery.of(context).size.height*0.2,
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.Product.Product_Title,
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          color: Color(0x00123465),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.401,
                                          child: Text(
                                            widget.Product.Product_Description,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Catagory",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xFF123456)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    5.0) //                 <--- border radius here
                                                ),
                                          ),
                                          child: Text(
                                            widget.Product.Product_Category,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0x00123456),
                                          border: Border.all(
                                              color: Color(0xFF123456)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: Center(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Price",
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                widget.Product.Product_Price,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF115ba6),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0x00123456),
                                          border: Border.all(
                                              color: Color(0xFF123456)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: Center(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Quantity",
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        x = x + 1;
                                                      });
                                                    },
                                                    child: Icon(Icons.add),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    x.toString(),
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF123456),
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        if (x > 0) {
                                                          x = x - 1;
                                                        }
                                                      });
                                                    },
                                                    child: Icon(Icons.remove),
                                                  ),
                                                ],
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ]),

                            //Text("IDR Furqan na data dalna hai using Product ka object "+widget.Product.Product_Title),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
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
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: ChatDetailsWidget(
                                      chatUser: snapshot.data,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF123456),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                width: MediaQuery.of(context).size.width * 0.42,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.chat,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Chat",
                                      style: TextStyle(
                                          color: Color(
                                            0xFFFFFFFF,
                                          ),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => add_OrderFireBase(
                                        hashCode: widget.Product.Product_Hash,
                                      ),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF123456),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                width: MediaQuery.of(context).size.width * 0.42,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Create Order",
                                      style: TextStyle(
                                          color: Color(
                                            0xFFFFFFFF,
                                          ),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Google_Map()

                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF123456),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                width: MediaQuery.of(context).size.width * 0.42,
                                height:
                                MediaQuery.of(context).size.height * 0.06,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Chal mela nu chalia",
                                      style: TextStyle(
                                          color: Color(
                                            0xFFFFFFFF,
                                          ),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),


                            // TextButton(
                            //   onPressed: () async {
                            //     await Navigator.pushReplacement(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => add_OrderFireBase(
                            //             hashCode: widget.Product.Product_Hash,
                            //           ),
                            //         ));
                            //   },
                            //   style: ButtonStyle(),
                            //   child: Text("Create order user"),
                            // )


                          ],

                        ),
                      )
                    ]),
              ),
            ),
          );
        });
  }
}
