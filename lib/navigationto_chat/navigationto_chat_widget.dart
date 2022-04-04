import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationtoChatWidget extends StatefulWidget {
  const NavigationtoChatWidget({Key key}) : super(key: key);

  @override
  _NavigationtoChatWidgetState createState() => _NavigationtoChatWidgetState();
}

class _NavigationtoChatWidgetState extends State<NavigationtoChatWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        title: Text(
          '[display_name]',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFF6EFDE),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.5,
                                  color: Color(0x7A000000),
                                  offset: Offset(0.2, 0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment:
                                AlignmentDirectional(-0.09999999999999998, 0),
                            child: Text(
                              'Hello John !',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
              child: Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.5,
                                  color: Color(0x7A000000),
                                  offset: Offset(0.2, 0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment:
                                AlignmentDirectional(0.050000000000000044, 0),
                            child: Text(
                              'Hello John !',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                            ),
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
    );
  }
}
