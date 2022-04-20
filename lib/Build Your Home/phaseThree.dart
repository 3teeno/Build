import 'package:build_i_t/flutter_flow/chat/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/CustomerHomePage.dart';

class phasePageThree extends StatefulWidget {
  const phasePageThree({Key key}) : super(key: key);

  @override
  _phasePageThreeState createState() => _phasePageThreeState();
}

class _phasePageThreeState extends State<phasePageThree> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePageWidget())),
        ),
        backgroundColor: Color(0xFFffffff),
        elevation: 0,
        title: Text(
          "Build Your Home Last Phase ",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      backgroundColor: Color(0xFFffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie_animations/pahseComplete.json",height: 450,width: 450,repeat: true),

          Padding(padding: EdgeInsets.symmetric(horizontal: 30),child: Text("Your new Guardian Built home is ready for you to move in and enjoy for many years to come!",style: TextStyle(fontFamily: 'Poppins',fontSize: 20),textAlign: TextAlign.center,)),
SizedBox(height: 15,),
          Padding(
            padding:
            EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: FFButtonWidget(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePageWidget()));
              },
              text: 'Go Back To Home',
              options: FFButtonOptions(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 45,
                color: Color(0xFF115ba6),
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFFFFFFFF),
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

        ],
      ),
    ));
  }
}
