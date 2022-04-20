import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_util.dart';
import 'package:build_i_t/market_place/Vendor_Gig.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//Market Places
Widget marketPlaceCard({BuildContext context,String title,String description,String quantity,String price,String imageUrl}){
  return InkWell(
      onTap: () async {
        // await Navigator.push(
        //   context,
        //   PageTransition(
        //     type: PageTransitionType.scale,
        //     alignment: Alignment.bottomCenter,
        //     duration: Duration(milliseconds: 300),
        //     reverseDuration: Duration(milliseconds: 300),
        //     child: MarketPlaceWidget(materialName: shopName,Contact: Contact,Email: Email,HRate: HRate,imgaeURL: ImageLink,),
        //   ),
        // );
      },
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
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
                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                    FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    description,
                    maxLines: 4,
                    style: FlutterFlowTheme.bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF000000),
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ));
}