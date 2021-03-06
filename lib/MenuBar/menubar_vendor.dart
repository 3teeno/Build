import 'package:build_i_t/Orders/Order_Page_Vendor.dart';
import 'package:build_i_t/Products/Products_Page_Customer.dart';
import 'package:build_i_t/Vendor_Services/ServicePage.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_util.dart';
import 'package:build_i_t/home_page/VendorHomePage.dart';
import 'package:build_i_t/login_page/Google_signIn.dart';
import 'package:build_i_t/market_place/Vendor_Gig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:build_i_t/authentication_service.dart';
import 'package:build_i_t/login_page/login_page_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:build_i_t/home_page/CustomerHomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Products/Model_Products.dart';
import '../backend/schema/users_record.dart';
import '../chat_details/chat_details_widget.dart';
import '../chat_main/chat_main_widget.dart';
import '../home_page/homepage_header_vendor.dart';


class Vendor_menuBar extends StatefulWidget {
  const Vendor_menuBar({Key key,this.Product}) : super(key: key);
  final Products Product;
  @override
  _Vendor_menuBarState createState() => _Vendor_menuBarState();
}

class _Vendor_menuBarState extends State<Vendor_menuBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Lottie.asset(
                'assets/lottie_animations/abstract.json',
                width: 150,
                height: 180,
                fit: BoxFit.cover,
                animate: true,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.2, 5),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Image.asset(
                  'assets/images/BuildIt.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 5),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VendorHomePageWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF115ba6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 24,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: Text(
                                  'Home',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 5),
                    child: InkWell(
                      onTap: () async {
                        final userdata = FirebaseFirestore.instance
                            .collection('users')
                            .doc("lIxDGfBtMAQKTm3f98VbSg3ktJz1");
                        var ref = await UsersRecord.getDocument(userdata);
                        var data=await ref.first;

                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.scale,
                            alignment: Alignment.bottomCenter,
                            duration: Duration(milliseconds: 300),
                            reverseDuration:
                            Duration(milliseconds: 300),
                            child: ChatDetailsWidget(
                              chatUser: data,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF115ba6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 24,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: Text(
                                  'Support',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 5),
                    child: InkWell(
                      onTap: () async {
                        print("Chat button navigation");
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatMainWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF115ba6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.chat,
                                color: Colors.white,
                                size: 24,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: Text(
                                  'Chat',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 5),
                    child: InkWell(
                      onTap: () async {
                        print("Order button navigation");
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Order_Page_Vendor(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF115ba6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.border_all_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: Text(
                                  'Orders',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 5),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Services_CRUD(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF115ba6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.design_services,
                                color: Colors.white,
                                size: 24,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: Text(
                                  'Services',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 5),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Product_Page_Vendor(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF115ba6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.store,
                                color: Colors.white,
                                size: 24,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: Text(
                                  'Store',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF115ba6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 24,
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: InkWell(
                                onTap: ()
                                async {
                                  await FirebaseAuth.instance.signOut();
                                  // final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                                  // await provider.logout();
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 300),
                                      reverseDuration: Duration(milliseconds: 300),
                                      child: LoginPageWidget(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Logout',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

