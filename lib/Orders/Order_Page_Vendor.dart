import 'package:build_i_t/Orders/pendingOrdersPage.dart';
import 'package:flutter/material.dart';

import 'Active_Orders_Customer.dart';
import 'Delivered_Orders.dart';

class Order_Page_Vendor extends StatefulWidget {
  const Order_Page_Vendor({Key key}) : super(key: key);

  @override
  State<Order_Page_Vendor> createState() => _Order_Page_VendorState();
}

class _Order_Page_VendorState extends State<Order_Page_Vendor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),),
            elevation: 0,
            title: Text("Manage Orders"),
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
                  //Active Orders
                  InkWell(
                    splashColor: Color(0xFF123456),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Active_Orders_Page_Customer(),
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
                          Text('Active Orders',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'Poppins'))
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
                  //Pending Orders
                  InkWell(
                    splashColor: Colors.green,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pendingOrdersPage(),
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
                            Text('Pending Orders',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Poppins'))
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
                  //Completed
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Delivered_Orders_Page()));
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
                            Text('Completed Orders',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'Poppins'),
                              textAlign: TextAlign.center,)
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
                        children: [
                          Image.asset(
                            "assets/images/feedback.png",
                            height: 70,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Feedback', style: TextStyle(
                              fontSize: 20, fontFamily: 'Poppins'))
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
                ],
              )),
        ));
  }
}