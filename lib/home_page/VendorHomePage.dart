import 'package:build_i_t/MenuBar/menubar_customer.dart';
import 'package:build_i_t/MenuBar/menubar_vendor.dart';
import 'package:build_i_t/Vendor_Services/Model_Services.dart';
import 'package:build_i_t/auth/firebase_user_provider.dart';
import 'package:build_i_t/backend/backend.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import '../Products/Active_Products.dart';
import '../Products/Product_Firestore.dart';
import 'package:flutter/material.dart';

import 'package:build_i_t/data.dart';
import 'homepage_header_vendor.dart';
import 'dart:math';

class VendorHomePageWidget extends StatefulWidget {
  const VendorHomePageWidget({Key key}) : super(key: key);

  @override
  _VendorHomePageWidgetState createState() => _VendorHomePageWidgetState();
}

class _VendorHomePageWidgetState extends State<VendorHomePageWidget> {
  //This is the function for Service list extraction
  Future<List> vendor_list = Services.receiveData();
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

  final List services = ['Electricion', 'Plumber', 'Carpenter', 'Painter'];
  @override
  Widget build(BuildContext context) {
    Data data = new Data();
    Random random = new Random();
    size = MediaQuery.of(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFffffff),
      drawer: Vendor_menuBar(),
      body: SafeArea(
        child:
            Column(
              children:[Container(
                height: 150,
                child: homePageHeader_vendor(),
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

                    //Active Products
                    InkWell(
                      splashColor: Color(0xFF123456),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Active_Products_Page(),
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
                            Text('Active Products',
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
                    //New Products
                    InkWell(
                      splashColor: Colors.green,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => New_Product_Page(), official
                            builder: (context) => Product_Firestore_CRUDS(), // temporary
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
                              Text('New Product',
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
                    //New Product
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Product Count',
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

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlacePicker(
                              apiKey: "AIzaSyAzuV8gbm7i5pPKnyiNs4YQgIVTaPxNI2E",   // Put YOUR OWN KEY here.
                              onPlacePicked: (result) {
                                print("Latitude:"+result.geometry.location.lat.toString()+"Longitude: "+result.geometry.location.lng.toString());
                                Map<String, dynamic> data = <String, dynamic>{
                                  "Lat":result.geometry.location.lat,
                                  "Lng":result.geometry.location.lng,
                                };

                                DocumentReference doc=FirebaseFirestore.instance.doc("users/"+currentUser.user.uid);
                                doc.update(data);
                                Navigator.of(context).pop();

                              },
                              initialPosition: getCurrentLocation(),
                            ),
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
                            ) ,Text('Add Location', style: TextStyle(fontSize: 20, fontFamily: 'Poppins'))]),
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
                    ),)
                  ],


        ),
              ),]
            ),
      ),
    );
  }

  LatLng getCurrentLocation() {
    return LatLng(31.601526082132683, 73.03575159999998);
  }
}
