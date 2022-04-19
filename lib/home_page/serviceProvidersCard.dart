import 'package:auto_size_text/auto_size_text.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_util.dart';
import 'package:build_i_t/market_place/Vendor_Gig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//Service Provider
Widget serviceProvidersCard(
BuildContext context,
    {
    String serviceName,
    }) {
  return InkWell(
    onTap: () async {
      // await Navigator.push(context, PageTransition(child: MarketPlaceWidget(materialName: serviceName,Contact: "123456",Email: "123465",HRate: "123456",imgaeURL: imageURL,), type: PageTransitionType.scale,
      //     alignment: Alignment.bottomCenter,duration: Duration(milliseconds: 300),reverseDuration: Duration(milliseconds: 300)));
    },
    child: Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.06,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: AutoSizeText(
            serviceName,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: Colors.black87,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}
