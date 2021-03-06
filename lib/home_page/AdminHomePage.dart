import 'package:build_i_t/Admin/Manage_Orders.dart';
import 'package:build_i_t/chat_main/chat_main_widget.dart';
import 'package:build_i_t/home_page/homePageHeader_Admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Admin/Manage_Payments.dart';
import '../Admin/Manage_Users.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../auth/firebase_user_provider.dart';
import '../chat_details/chat_details_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../login_page/login_page_widget.dart';

class AdminHomePageWidget extends StatefulWidget {
  const AdminHomePageWidget({Key key}) : super(key: key);

  @override
  _AdminHomePageWidgetState createState() => _AdminHomePageWidgetState();
}

class _AdminHomePageWidgetState extends State<AdminHomePageWidget> {
  //This is the function for Service list extraction
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
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context);
    final userdata = FirebaseFirestore.instance
        .collection('users')
        .doc("lIxDGfBtMAQKTm3f98VbSg3ktJz1");
    return
      StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(userdata),
    builder: (context, snapshot) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFffffff),
      body: SafeArea(
        child:
        Column(
            children:[
              Container(
                height: 150,
                child: homePageHeader_Admin(),
            ),
              Expanded(
                child: GridView.extent(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(16),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  maxCrossAxisExtent: 200.0,
                  children: <Widget>[

                    //Manage Orders
                    InkWell(
                      splashColor: Color(0xFF123456),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Manage_Orders(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/activeOrder.png",
                              height: 70,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Manage Orders',
                                style: TextStyle(fontSize: 20, fontFamily: 'Poppins'))
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 20,
                                offset: Offset(0, 3),
                              ),
                            ]),
                      ),
                    ),
                    //Manage Users
                    InkWell(
                      splashColor: Colors.green,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => New_Product_Page(), official
                            builder: (context) => Manage_Users(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/pendingOrders.png",
                                height: 70,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Manage Users',
                                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'))
                            ]),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 20,
                                offset: Offset(0, 3),
                              ),
                            ]),
                      ),
                    ),
                    //Help
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Resolved',
                              style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),textAlign: TextAlign.center,),
                            SizedBox(
                              height: 10,
                            ),
                            Text('7',
                              style: TextStyle(fontSize: 20, fontFamily: 'Poppins',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                          ]),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset: Offset(0, 3),
                            ),
                          ]),
                    ),
                    //Feedback
                    InkWell(
                      splashColor: Colors.green,
                      onTap: () async {

                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.scale,
                            alignment: Alignment.bottomCenter,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: ChatMainWidget()
                          ),
                        );

                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[Image.asset(
                              "assets/images/feedback.png",
                              height: 70,
                            ),
                              SizedBox(
                                height: 20,
                              ) ,Text('Support', style: TextStyle(fontSize: 20, fontFamily: 'Poppins'))]),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 20,
                                offset: Offset(0, 3),
                              ),
                            ]),
                      ),),
                    ElevatedButton(onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      currentUser=null;
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
                        child: Text("Logout"))
                  ],


                ),
              ),]
        ),
      ),
    );
    });
  }

}
