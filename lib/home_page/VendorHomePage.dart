import 'package:build_i_t/MenuBar/menubar_top.dart';
import 'package:build_i_t/VendorServicesModel.dart';
import 'package:build_i_t/all_market_places/Search_Material.dart';
import 'package:build_i_t/all_service_providers/search_serviceProviders.dart';
import 'package:build_i_t/home_page/serviceProvidersCard.dart';
import 'package:build_i_t/search_page/search_page_widget.dart';
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

class VendorHomePageWidget extends StatefulWidget {
  const VendorHomePageWidget({Key key}) : super(key: key);

  @override
  _VendorHomePageWidgetState createState() => _VendorHomePageWidgetState();
}

class _VendorHomePageWidgetState extends State<VendorHomePageWidget> {
  //This is the function for Service list extraction
  Future<List> vendor_list = Database.receiveData();
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF6EFDE),
      drawer: menuBar(),
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
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Build Your Home(Button pressed)');
                      },
                      text: 'Vendor Build Your Home',
                      options: FFButtonOptions(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        color: Color(0xFF282828),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFFFB700),
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

                  //Services Providers (Text Row)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                          child: AutoSizeText(
                            'Service Providers',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                          child: InkWell(
                            onTap: () {
                              showSearch(
                                  context: context,
                                  delegate:
                                      search_serviceProviders(ratingBarValue1));
                            },
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

                  

                  serviceProvidersCard(
                      context,
                      serviceName: services[0]),
                  //Maekrt Places (Text Row)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(21, 0, 21, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
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
                            padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
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
          ],
        ),
      ),
    );
  }
}
