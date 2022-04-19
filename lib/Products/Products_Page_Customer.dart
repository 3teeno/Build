
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Orders/Active_Orders.dart';
import '../Orders/Delivered_Orders.dart';


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
            title: Text("Manage Products"),
            backgroundColor: Colors.green,
          ),
          body: Center(
              child: GridView.extent(
                primary: false,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                maxCrossAxisExtent: 200.0,
                children: <Widget>[
                  InkWell(
                    splashColor: Colors.blue,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Active_Orders_Page(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Active', style: TextStyle(fontSize: 20)),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          border: Border(
                            top: BorderSide(width: 5.0, color: Colors.blue),
                          ),
                          // borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(5),
                          //     topRight: Radius.circular(5),
                          //     bottomLeft: Radius.circular(5),
                          //     bottomRight: Radius.circular(5)),
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
                  InkWell(
                    splashColor: Colors.green,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Delivered_Orders_Page(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Pending', style: TextStyle(fontSize: 20)),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          border: Border(
                            top: BorderSide(width: 5.0, color: Colors.green),
                          ),
                          // borderRadius: BorderRadius.only(
                          // topLeft: Radius.circular(5),
                          // topRight: Radius.circular(5),
                          // bottomLeft: Radius.circular(5),
                          // bottomRight: Radius.circular(5)),
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
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Completed', style: TextStyle(fontSize: 20)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(width: 5.0, color: Colors.orange),
                        ),

                        // borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(5),
                        //     topRight: Radius.circular(5),
                        //     bottomLeft: Radius.circular(5),
                        //     bottomRight: Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 20,
                            offset: Offset(0, 3),
                          ),
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Feedback', style: TextStyle(fontSize: 20)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(width: 5.0, color: Colors.orange),
                        ),
                        // borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(5),
                        //     topRight: Radius.circular(5),
                        //     bottomLeft: Radius.circular(5),
                        //     bottomRight: Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 20,
                            offset: Offset(0, 3),
                          ),
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Spent', style: TextStyle(fontSize: 20)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(width: 5.0, color: Colors.red),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 20,
                            offset: Offset(0, 3),
                          ),
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Help', style: TextStyle(fontSize: 20)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(width: 5.0, color: Colors.red),
                        ),
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
