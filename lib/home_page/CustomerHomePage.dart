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
  Future<List> vendor_list = Services.receiveData();
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

  void initState() {
    super.initState();
    textController = TextEditingController();
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
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF2F2F2),
            drawer: Customer_menuBar(),
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    child: homePageHeader(),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        //Build Your Home
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
                              if (snapshot['Activated'] == 0) {
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
                        //
                        // serviceProvidersCard(
                        //     context,
                        //     serviceName: services[0]),
                        //Maekrt Places (Text Row)
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

                        GridView.extent(
                          primary: false,
                          padding: const EdgeInsets.all(16),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          maxCrossAxisExtent: 400.0,
                          children: [
                            marketPlaceCard(
                                ratingValue: ratingBarValue1,
                                ratingNo: random.nextInt(5).toDouble(),
                                context: context,
                                ImageLink: data.imagesServices().toString(),
                                shopName: data.names().toString(),
                                shopLocation: "Loney Wala",
                                Email: "abc@gmail.com",
                                Contact: "+92-13456789",
                                HRate: random.nextInt(3000).toString()),
                            marketPlaceCard(
                                ratingValue: ratingBarValue1,
                                ratingNo: random.nextInt(5).toDouble(),
                                context: context,
                                ImageLink: data.imagesServices().toString(),
                                shopName: data.names().toString(),
                                shopLocation: "Loney Wala",
                                Email: "abc@gmail.com",
                                Contact: "+92-13456789",
                                HRate: random.nextInt(3000).toString()),
                          ],
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                //Market Places

                                marketPlaceCard(
                                    ratingValue: ratingBarValue1,
                                    ratingNo: random.nextInt(5).toDouble(),
                                    context: context,
                                    ImageLink: data.imagesServices().toString(),
                                    shopName: data.names().toString(),
                                    shopLocation: "Loney Wala",
                                    Email: "abc@gmail.com",
                                    Contact: "+92-13456789",
                                    HRate: random.nextInt(3000).toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                marketPlaceCard(
                                    ratingValue: ratingBarValue1,
                                    ratingNo: random.nextInt(5).toDouble(),
                                    context: context,
                                    ImageLink: data.imagesServices().toString(),
                                    shopName: data.names().toString(),
                                    shopLocation: "Loney Wala",
                                    Email: "abc@gmail.com",
                                    Contact: "+92-13456789",
                                    HRate: random.nextInt(3000).toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                marketPlaceCard(
                                    ratingValue: ratingBarValue1,
                                    ratingNo: random.nextInt(5).toDouble(),
                                    context: context,
                                    ImageLink: data.imagesServices().toString(),
                                    shopName: data.names().toString(),
                                    shopLocation: "Loney Wala",
                                    Email: "abc@gmail.com",
                                    Contact: "+92-13456789",
                                    HRate: random.nextInt(3000).toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                marketPlaceCard(
                                    ratingValue: ratingBarValue1,
                                    ratingNo: random.nextInt(5).toDouble(),
                                    context: context,
                                    ImageLink: data.imagesServices().toString(),
                                    shopName: data.names().toString(),
                                    shopLocation: "Loney Wala",
                                    Email: "abc@gmail.com",
                                    Contact: "+92-13456789",
                                    HRate: random.nextInt(3000).toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                marketPlaceCard(
                                    ratingValue: ratingBarValue1,
                                    ratingNo: random.nextInt(5).toDouble(),
                                    context: context,
                                    ImageLink: data.imagesServices().toString(),
                                    shopName: data.names().toString(),
                                    shopLocation: "Loney Wala",
                                    Email: "abc@gmail.com",
                                    Contact: "+92-13456789",
                                    HRate: random.nextInt(3000).toString()),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ),

                        //Recent Chat
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: ChatDetailsWidget(
                              chatUser: snapshot.data,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Chatt?',
                        style: FlutterFlowTheme.title2.override(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
