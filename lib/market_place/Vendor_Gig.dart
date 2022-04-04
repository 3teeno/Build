import 'package:flutter/scheduler.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/CustomerHomePage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarketPlaceWidget extends StatefulWidget {
  final String materialName,Email,Contact,HRate,imgaeURL;
  const MarketPlaceWidget({Key key,@required this.materialName,@required this.imgaeURL,@required this.Email,@required this.Contact,@required this.HRate}) : super(key: key);

  @override
  _MarketPlaceWidgetState createState() => _MarketPlaceWidgetState();
}

class _MarketPlaceWidgetState extends State<MarketPlaceWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Material Profile"),
        backgroundColor: Color(0xFFF6EFDE),
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Color(0xFFF6EFDE),
      body: SafeArea(
        child: SingleChildScrollView (
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                                    widget.materialName,
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
                                    'PKR '+widget.HRate,
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
                                          widget.imgaeURL,
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
                                  // child: FFButtonWidget(
                                  //   onPressed: () {
                                  //     print('Button pressed ...');
                                  //   },
                                  //   text: 'Edit Profile',
                                  //   icon: Icon(
                                  //     Icons.edit_outlined,
                                  //     size: 18,
                                  //   ),
                                  //   options: FFButtonOptions(
                                  //     width: 150,
                                  //     height: 40,
                                  //     color: Color(0xFF212121),
                                  //     textStyle:
                                  //         FlutterFlowTheme.subtitle2.override(
                                  //       fontFamily: 'Poppins',
                                  //       color: Color(0xFFF4BB03),
                                  //     ),
                                  //     borderSide: BorderSide(
                                  //       color: Colors.transparent,
                                  //       width: 1,
                                  //     ),
                                  //     borderRadius: 12,
                                  //   ),
                                  // ),
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
                                      color: Color(0xFFF6EFDE),
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
                                      color: Color(0xFFF6EFDE),
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
                                      color: Color(0xFFF6EFDE),
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                'Location',
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
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                constraints: BoxConstraints(
                                  maxHeight: 150,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFF212121),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/GoogleMapTA.jpg',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Call',
                            icon: Icon(
                              Icons.call_rounded,
                              size: 18,
                            ),
                            options: FFButtonOptions(
                              width: 150,
                              height: 40,
                              color: Color(0xFF212121),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFFF4BB03),
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 10,
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
                                color: Color(0xFFF4BB03),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
