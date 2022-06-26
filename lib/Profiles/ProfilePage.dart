import 'package:flutter/material.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key key}) : super(key: key);

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            elevation: 0,
            title: Text("Manage Profile"),
            backgroundColor: Color(0xFF115ba6),
          ),
        ));

  }
}


