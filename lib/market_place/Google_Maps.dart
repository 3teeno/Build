import 'dart:async';

import 'package:build_i_t/home_page/CustomerHomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

double lat, lon;

class Google_Map extends StatefulWidget {
  Google_Map(double latitude, double longitude) {
    lat = latitude;
    lon = longitude;
  }

  @override
  State<Google_Map> createState() => Google_MapState();
}

// void setLatLong(double latitude,double longitude){
//   lat=latitude;
//   lon=longitude;
// }
final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(lat, lon),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414);

class Google_MapState extends State<Google_Map> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(lat, lon),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(lat, lon),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: AppBar(
          foregroundColor: Color(0xFF121212),
          backgroundColor: Color(0xFFffffff),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomePageWidget())),
          ),
          title: Text("Google Map"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(lat, lon),
                tilt: 59.440717697143555,
                zoom: 19.151926040649414),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),


        // GoogleMap(
        //   mapType: MapType.normal,
        //   initialCameraPosition: _kGooglePlex,
        //   onMapCreated: (GoogleMapController controller) {
        //     _controller.complete(controller);
        //   },
        // ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToTheLake,
        //   label: Text('Zoom'),
        //   backgroundColor: Color(0xFF121212),
        //   icon: Icon(Icons.zoom_out_map),
        // ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
