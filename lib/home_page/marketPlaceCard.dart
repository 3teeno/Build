import 'package:build_i_t/Products/Product_Page.dart';
import 'package:build_i_t/backend/backend.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_util.dart';
import 'package:build_i_t/market_place/Vendor_Gig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:build_i_t/chat_details/chat_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Products/Model_Products.dart';

//Market Places
Widget marketPlaceCard(
    {BuildContext context,
    String hash,
    String title,
    String description,
    String quantity,
    String price,
    String imageUrl,
    String catagory,
    String vendorID}) {
  final userdata = FirebaseFirestore.instance.collection('users').doc(vendorID);
  return InkWell(
      onTap: () async {
        //await print(hash+imageUrl+price+quantity+vendorID+title+description);
        await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(
                Product: new Products(
                    Product_Images: imageUrl,
                    Product_Price: price.toString(),
                    Product_Quantity: quantity.toString(),
                    Product_Vendor_id: vendorID.toString(),
                    Product_Title: title.toString(),
                    Product_Description: description.toString(),
                    Product_Category: "catagory"),
              ),
            ));

        // final userdata = FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(vendorID);
        // var ref = UsersRecord.getDocument(userdata);
        // await Navigator.push(
        //   context,
        //   PageTransition(
        //     type: PageTransitionType.scale,
        //     alignment: Alignment.bottomCenter,
        //     duration: Duration(milliseconds: 300),
        //     reverseDuration: Duration(milliseconds: 300),
        //     child: ChatDetailsWidget(
        //       chatUser: snapshot.data,
        //     ),
        //   ),
        // );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            color: Color(0XFFFFFFFF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
//                'https://images.pexels.com/photos/159306/construction-site-build-construction-work-159306.jpeg?cs=srgb&dl=pexels-pixabay-159306.jpg&fm=jpg',
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Text(
                            title,
                            style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.44,
                            child: Text(
                              description,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price (PKR)"),
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                price,
                                style: TextStyle(
                                  fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF115ba6)),
                              )),
                        ],
                      ),
                    ),
                  ),


                ],
              )
            ],
          ),
        ),
      ));
}
