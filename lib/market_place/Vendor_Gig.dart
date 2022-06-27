import 'dart:async';

import 'package:build_i_t/Orders/Model_Orders.dart';
import 'package:build_i_t/Products/Product_Page.dart';
import 'package:build_i_t/backend/backend.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/CustomerHomePage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Google_Maps.dart';

class MarketPlaceWidget extends StatefulWidget {
  final String vendorID, Name, Email, Contact, hRate, imageUrl;

  final double Lat, Lng;
  const MarketPlaceWidget(
      {Key key,
      @required this.vendorID,
      @required this.Name,
      @required this.Email,
      @required this.Contact,
      @required this.hRate,
      @required this.imageUrl,
      this.Lat,
      this.Lng})
      : super(key: key);

  @override
  _MarketPlaceWidgetState createState() => _MarketPlaceWidgetState();
}

class _MarketPlaceWidgetState extends State<MarketPlaceWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    DocumentReference doc =
        FirebaseFirestore.instance.doc("users/" + widget.vendorID);
    List reviews;
    bool reviewCheck = false;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Vendor Profile"),
        backgroundColor: Color(0xFFffffff),
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePageWidget())),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Color(0xFFffffff),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF282828),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  widget.Name,
                                  //'John Ehlia',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  'Email',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF282828),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  widget.Email,
//                                    'johnehlia@abc.com',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  'Contact',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF282828),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  widget.Contact,
//                                    '+92-3133457896',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  'Hourly Rate',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF282828),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  'PKR ' + widget.hRate,
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        widget.imageUrl,
//                                          'https://nationaleconomyplumber.com/wp-content/uploads/2020/10/Different-Types-of-Plumbers.jpg',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 5,
                      thickness: 1,
                      color: Color(0xFF212121),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFF212121),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 15, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Services',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0x00212121),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 100,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFffffff),
                                    borderRadius: BorderRadius.circular(50),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: AutoSizeText(
                                      'Plumber',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFffffff),
                                    borderRadius: BorderRadius.circular(50),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: AutoSizeText(
                                      'Electrition',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFffffff),
                                    borderRadius: BorderRadius.circular(50),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: AutoSizeText(
                                      'Contractor',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () async {
                          setState(() {
                            reviewCheck = true;
                          });
                          print(reviewCheck);
                          print("reviews");
                          Order orders = new Order();
                          reviews =
                              await Order.fetch_vendor_order(widget.vendorID);
                          print(reviews);
                        },
                        child: Text("Show Reviews")),
                    reviewCheck ? Text("ajksd") : Text(""),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              //obj.setLatLong(widget.Lat,widget.Lng);
                              print("Han ho gaya");
                              await Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Google_Map(widget.Lat, widget.Lng)));
                            },
                            text: 'Show on Map',
                            icon: Icon(
                              Icons.map,
                              size: 18,
                            ),
                            options: FFButtonOptions(
                              width: 150,
                              height: 40,
                              color: Color(0xFF212121),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFFffffff),
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Chat',
                    icon: Icon(
                      Icons.chat_bubble,
                      size: 18,
                    ),
                    options: FFButtonOptions(
                      width: 150,
                      height: 40,
                      color: Color(0xFF212121),
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFffffff),
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
