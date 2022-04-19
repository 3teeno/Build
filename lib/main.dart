import 'package:build_i_t/authentication_service.dart';
import 'package:build_i_t/login_page/Google_signIn.dart';
import 'package:build_i_t/login_page/login_page_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:build_i_t/home_page/CustomerHomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'auth/auth_util.dart';
import 'auth/firebase_user_provider.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Updated this Code on 6:42 PM 23RD Jan,2022
//Continue with this one
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  Stream<ChatFirebaseUser> userStream;
  ChatFirebaseUser initialUser;
  final authUserSub = authenticatedUserStream.listen((_) {});
  void initState() {
    super.initState();
    userStream = chatFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong!");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LoginPageWidget(),
            );
          }
          return Center(child: Lottie.network("https://assets7.lottiefiles.com/packages/lf20_lz5srsyo.json",repeat: true),);
        });
  }

}




//Extra

// => ChangeNotifierProvider(
//     create: (context) => GoogleSignInProvider(),
//     child: MaterialApp(
//     title: 'BuildIT',
//     localizationsDelegates: [
//       GlobalMaterialLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//       GlobalCupertinoLocalizations.delegate,
//     ],
//     supportedLocales: const [Locale('en', '')],
//     theme: ThemeData(primarySwatch: Colors.blue),
//     home: LoginPageWidget(),
//   ));
// }
