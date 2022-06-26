import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMaps extends StatefulWidget {
  const ShowMaps({Key key}) : super(key: key);

  @override
  State<ShowMaps> createState() => _ShowMapsState();
}

class _ShowMapsState extends State<ShowMaps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps Search"),
      ),
      body: Column(
        children: [
          GoogleMap(initialCameraPosition: CameraPosition()),
          Container(

            constraints: BoxConstraints(minWidth: 100, maxWidth: 390),
            width: 390.0,
            height: 350.0,
            color: Colors.amber,
          ),
          Container(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 390),
            width: 390.0,
            height: 250.0,
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}

