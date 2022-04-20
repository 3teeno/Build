import 'package:build_i_t/Build%20Your%20Home/phasesPage.dart';
import 'package:build_i_t/MenuBar/menubar_customer.dart';
import 'package:build_i_t/Vendor_Services/Model_Services.dart';
import 'package:build_i_t/all_market_places/Search_Material.dart';
import 'package:build_i_t/all_service_providers/search_serviceProviders.dart';
import 'package:build_i_t/backend/backend.dart';
import 'package:build_i_t/chat_details/chat_details_widget.dart';
import 'package:build_i_t/home_page/serviceProvidersCard.dart';
import 'package:build_i_t/search_page/search_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Build Your Home/BuildYourHome_Main.dart';
import '../Products/Model_Products.dart';
import '../auth/firebase_user_provider.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:build_i_t/data.dart';
import 'homepage_header.dart';
import 'marketPlaceCard.dart';
import 'dart:math';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  //This is the function for Service list extraction
  List<Products> products = [];
  List my_products = [];
  Future<void> initialise() async {
    await Products.fetch_product().then((value) => setState(() {
      my_products = value;
      print(value);
      for (var i = 0; i < my_products.length; i++) {
        Products temp = Products(
          Product_Hash: my_products[i]['Product_Hash'],
          Product_Title: my_products[i]['Product_Title'],
          Product_Description: my_products[i]['Product_Description'],
          Product_Quantity: my_products[i]['Product_Quantity'],
          Product_Price: my_products[i]['Product_Price'],
          Product_Vendor_id: my_products[i]['Product_Vendor_id'],
        );
        products.add(temp);
        print("Products");
      }
    }));
    print("Maa aa gaya");
    print(my_products);
    if (my_products.isEmpty) {
      print("Empty Products Against Vendor");
    }


  }
  // Future<List> vendor_list = Services.receiveData();
  TextEditingController textController;
  Random random = new Random();
  double ratingBarValue1;
  double ratingBarValue2;
  double ratingBarValue3;
  double ratingBarValue4;
  double ratingBarValue5;
  double ratingBarValue6;
  double ratingBarValue7;
  double ratingBarValue8;
  double ratingBarValue9;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  MediaQueryData size;

  Future<void> initState() {
    print("Product init is called from Home");
    textController = TextEditingController();
    initialise();
  }

  final List services = ['Electricion', 'Plumber', 'Carpenter', 'Painter'];
  @override
  Widget build(BuildContext context) {
    Data data = new Data();
    Random random = new Random();
    size = MediaQuery.of(context);
    final userdata = FirebaseFirestore.instance
        .collection('users')
        .doc('AF3aPsQsIZRB7RxGduo8wpgKViW2');

    return StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(userdata),
        builder: (context, snapshot) {
          return SafeArea(
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFFF2F2F2),
              drawer: Customer_menuBar(),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      child: homePageHeader(),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: FFButtonWidget(
                        onPressed: () async {
                          print('Build Your Home(Button pressed)');
                          String uid = currentUser.user.uid;
                          DocumentReference doc =
                              FirebaseFirestore.instance.doc('users/$uid');
                          DocumentSnapshot snapshot = await doc.get();
                          if (snapshot['Activated'] == 1) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        phasesPageMain()));
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        startingScreen()));
                          }
                        },
                        text: 'Build Your Home',
                        options: FFButtonOptions(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          color: Color(0xFFFFFFFF),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.normal,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(21, 0, 21, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                            child: AutoSizeText(
                              'Market Places',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.title3.override(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showSearch(
                                  context: context,
                                  delegate: DataSearch(ratingBarValue1));
                            },
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, 1, 0, 0),
                              child: AutoSizeText(
                                'See all',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF4F4F4F),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: products.map((e) => marketPlaceCard(
                      quantity: e.Product_Quantity,
                      price: e.Product_Price,
                      imageUrl: "https://images.pexels.com/photos/159306/construction-site-build-construction-work-159306.jpeg?cs=srgb&dl=pexels-pixabay-159306.jpg&fm=jpg",
                      description: e.Product_Description,
                      title: e.Product_Title,
                      vendorID: e.Product_Vendor_id,
                      context: context)).toList(),
                    ),
                ]),
              ),
          ));
        });
  }
}
