import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_util.dart';
import 'package:build_i_t/market_place/Vendor_Gig.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//Market Places
Widget marketPlaceCard({double ratingValue,double ratingNo,BuildContext context,String ImageLink,String shopName,String shopLocation,String Email,String Contact,String HRate}){
  return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300),
            child: MarketPlaceWidget(materialName: shopName,Contact: Contact,Email: Email,HRate: HRate,imgaeURL: ImageLink,),
          ),
        );
      },
      child:Container(
        width: 150,
        height: 180,
        decoration: BoxDecoration(
          color: Color(0xFF282828),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding:
          EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    2, 3, 2, 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    ImageLink,
//                'https://images.pexels.com/photos/159306/construction-site-build-construction-work-159306.jpeg?cs=srgb&dl=pexels-pixabay-159306.jpg&fm=jpg',
                    width: 150,
                    height: 108,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    10, 0, 0, 0),
                child: Text(
                  shopName,
//              'Shop Name',
                  style:
                  FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    8, 2, 0, 0),
                child: RatingBar.builder(
                  // onRatingUpdate: (newValue) => setState(
                  //         () => ratingValue = newValue),
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rounded,
                    color: Color(0xFFFFB700),
                  ),
                  direction: Axis.horizontal,
                  initialRating: ratingValue ??= ratingNo,
                  unratedColor: Color(0xFF9E9E9E),
                  itemCount: 5,
                  itemSize: 14,
                  glowColor: Color(0xFFFFB700),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    8, 2, 8, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xFFF6EFDE),
                      size: 15,
                    ),
                    Text(
                      shopLocation,
//                  'Loney Wala',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFF6EFDE),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
}