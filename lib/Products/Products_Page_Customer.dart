
import 'package:build_i_t/Products/Active_Products.dart';
import 'package:build_i_t/Products/Update_Product_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Orders/Active_Orders_Customer.dart';
import '../Orders/Delivered_Orders.dart';
import 'New_Product_Page.dart';


class Product_Page_Vendor extends StatefulWidget {
  const Product_Page_Vendor({Key key}) : super(key: key);

  @override
  State<Product_Page_Vendor> createState() => _Product_Page_VendorState();
}

class _Product_Page_VendorState extends State<Product_Page_Vendor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context) ,),
            elevation: 0,
            title: Text("Manage Products"),
            backgroundColor: Color(0xFF123456),
          ),
          body: Center(
              child: GridView.extent(
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
                          builder: (context) => New_Product_Page(),
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
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Update_Product_Page(),
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
                              "assets/images/completed.png",
                              height: 70,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Update Product',
                              style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),textAlign: TextAlign.center,)
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
                  ),
                  //Feedback
                  Container(
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
                          ) ,Text('Help', style: TextStyle(fontSize: 20, fontFamily: 'Poppins'))]),
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
                ],
              )),
        ));
  }
}
