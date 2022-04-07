import 'package:build_i_t/backend/backend.dart';

import 'package:build_i_t/home_page/CustomerHomePage.dart';
import 'package:build_i_t/main.dart';
import 'package:build_i_t/search_page/search_page_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../authentication_service.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:build_i_t/Forgot Password/ForgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:build_i_t/registration_page/Registration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Google_signIn.dart';
import 'login.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  String dropDownValue;
  TextEditingController emailController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  bool loading = false;
  bool execution = false;

  Login() async {}
  Future<bool> hasUserLogged() async {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Failed To Authenticate"));
          } else if (snapshot.hasData) {
            //Already Logged in State
            FirebaseAuth.instance.signOut();
            return logIn();
          } else
            return logIn();
        });

  }
}
