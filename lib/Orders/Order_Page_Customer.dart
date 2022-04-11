import 'package:build_i_t/Orders/Delivered_Orders.dart';
import 'package:build_i_t/home_page/CustomerHomePage.dart';
import 'package:build_i_t/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Model_Orders.dart';
import 'Active_Orders.dart';

class Order_Page_Customer extends StatefulWidget {
  const Order_Page_Customer({Key key}) : super(key: key);

  @override
  State<Order_Page_Customer> createState() => _Order_Page_CustomerState();
}

class _Order_Page_CustomerState extends State<Order_Page_Customer> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Manage Orders"),
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
                            color: Colors.grey.withOpacity(0.2),                            spreadRadius: 1,
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
                            color: Colors.grey.withOpacity(0.2),                            spreadRadius: 1,
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
                            color: Colors.grey.withOpacity(0.2),                            spreadRadius: 1,
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
                            color: Colors.grey.withOpacity(0.2),                            spreadRadius: 1,
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
