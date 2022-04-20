import 'package:auto_size_text/auto_size_text.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_util.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_widgets.dart';
import 'package:build_i_t/market_place/Vendor_Gig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget singleCard(BuildContext context,
    {double ratingBarValue,
    double ratingNo,
    String imageURL,
    String storeName,
    String storLocation}) {
  return InkWell(
    onTap: () async {
      await Navigator.push(
          context,
          PageTransition(
              child: MarketPlaceWidget(
                materialName: storeName,
                Contact: "123456",
                Email: "123465",
                HRate: "123456",
                imgaeURL: imageURL,
              ),
              type: PageTransitionType.scale,
              alignment: Alignment.centerRight,
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300)));
    },
    child: Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: Color(0xFF282828),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageURL,
//                      'https://media.istockphoto.com/photos/stacked-lumber-and-blueprints-at-a-construction-site-picture-id104294966?k=20&m=104294966&s=612x612&w=0&h=IFfLurqe8SF2iPmmhJZzpIM3Mlg0v-HYkrqc8OQ5CNQ=',
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height * 0.24,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                    child: AutoSizeText(
                      storeName,
//                    'Store Name',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                    child: RatingBar.builder(
                      // onRatingUpdate: (newValue) => setState(
                      //         () => ratingBarValue1 = newValue),
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: Color(0xFFF4BB03),
                      ),
                      direction: Axis.horizontal,
                      initialRating: ratingBarValue ??= ratingNo,
                      unratedColor: Color(0xFF9E9E9E),
                      itemCount: 5,
                      itemSize: 15,
                      glowColor: Color(0xFFF4BB03),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xFFF5F5F5),
                    size: 18,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                    child: AutoSizeText(
                      storLocation,
//                          'Lonney wala',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 5),
              child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: ['Brick', 'Contractor', 'Levy', 'Pipes']
                      .map((String name) => Chip(
                            label: Text(name),
                            backgroundColor: Color(0xFFF6EFDE),
                          ))
                      .toList()),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Icon(
//                   Icons.location_on,
//                   color: Color(0xFFF5F5F5),
//                   size: 18,
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
//                   child: AutoSizeText(
//                     storLocation,
// //                          'Lonney wala',
//                     style: FlutterFlowTheme.bodyText1.override(
//                       fontFamily: 'Poppins',
//                       color: Colors.white,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//
//
//               ],
//             ),
            ),
          ],
        ),
      ),
    ),
  );
}
