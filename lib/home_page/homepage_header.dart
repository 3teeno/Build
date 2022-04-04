import 'package:build_i_t/MenuBar/menubar_top.dart';
import 'package:build_i_t/all_market_places/Search_Material.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_util.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_widgets.dart';
import 'package:build_i_t/market_place/Vendor_Gig.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class homePageHeader extends StatefulWidget {
  const homePageHeader({Key key}) : super(key: key);

  @override
  _homePageHeaderState createState() => _homePageHeaderState();
}

class _homePageHeaderState extends State<homePageHeader> {
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
              color: Color(0xFF282828),
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
        Align(
          alignment: AlignmentDirectional(-0.85, 0.8),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
            child: FFButtonWidget(
              onPressed: () {
                // MaterialPageRoute(
                //   builder: (context) =>sh(),
                // );
                showSearch(context: context, delegate: DataSearch(ratingBarValue1));
              },
              text: 'Search',
              icon: Icon(
                Icons.search,
                color: Color(0xFF212121),
                size: 20,
              ),
              options: FFButtonOptions(
                width: MediaQuery.of(context).size.width*0.3,
                // padding: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                height: 50,
                color: Color(0xFFF4BB03),
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}