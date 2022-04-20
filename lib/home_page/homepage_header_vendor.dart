import 'package:build_i_t/MenuBar/menubar_customer.dart';
import 'package:build_i_t/all_market_places/Search_Material.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_util.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_widgets.dart';
import 'package:build_i_t/market_place/Vendor_Gig.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class homePageHeader_vendor extends StatefulWidget {
  const homePageHeader_vendor({Key key}) : super(key: key);

  @override
  _homePageHeader_vendorState createState() => _homePageHeader_vendorState();
}

class _homePageHeader_vendorState extends State<homePageHeader_vendor> {
  TextEditingController textController;
  double ratingBarValue1;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: 125,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF115ba6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.7, -0.8),
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Image.asset(
                        'assets/images/BuildIt_V002.png',
                        width: 130,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.9, -0.6),
                    child: InkWell(
                      onTap: () async {
                        // await Navigator.push(context, PageTransition(child: menuBar(), type: PageTransitionType.scale,
                        //     alignment: Alignment.centerLeft,duration: Duration(milliseconds: 300),reverseDuration: Duration(milliseconds: 300)));
                        Scaffold.of(context).openDrawer();
                        //scaffoldKey.currentState.openDrawer();
                      },
                      child: Icon(
                        Icons.menu_sharp,
                        color: Color(0xFFF6EFDE),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.9, -0.4),
          child: Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_LqA9yY.json',
//            'https://assets3.lottiefiles.com/packages/lf20_zJLfwG.json',
            width: 130,
            height: 110,
            fit: BoxFit.cover,
            animate: true,
          ),
        ),

      ],
    );
  }
}