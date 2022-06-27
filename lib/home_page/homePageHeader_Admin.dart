import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class homePageHeader_Admin extends StatefulWidget {
  const homePageHeader_Admin({Key key}) : super(key: key);

  @override
  State<homePageHeader_Admin> createState() => _homePageHeader_AdminState();
}

class _homePageHeader_AdminState extends State<homePageHeader_Admin> {
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
            child: Stack(
              children: [
                Center(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
