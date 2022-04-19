import 'package:flutter/material.dart';
import 'package:build_i_t/Products/Model_Products.dart';

import '../Orders/Model_Orders.dart';

class Active_Products_Page extends StatefulWidget {
  const Active_Products_Page({Key key}) : super(key: key);

  @override
  State<Active_Products_Page> createState() => _Active_Products_PageState();
}

class _Active_Products_PageState extends State<Active_Products_Page> {
  List<Order> orders = [];
  List mydocs = [];
  Future<void> initialise() async {
    await Order.fetch_order().then ((value) => setState((){ mydocs=value; } ) );
    if(mydocs.isEmpty)
      {print("Empty Products Against Vendor");}
    for (var i = 0; i < mydocs.length; i++) {
      Order temp = Order(
        Order_Hash: mydocs[i]['Order_Hash'],
        Order_Title: mydocs[i]['Order_Title'],
        Order_Duration: mydocs[i]['Order_Duration'],
        Order_Description: mydocs[i]['Order_Description'],
        Order_Price: mydocs[i]['Order_Price'],
        Order_Status: mydocs[i]['Order_Status'],);
      orders.add(temp);
    }
  }
  Future<void> initState() {
    print("Init is called ");
    initialise();
  }
  Widget Product_Card_Template_Active(myorder) {
    return InkWell(
      onTap: () => {print("Order Hash : "+myorder.Order_Hash)},
      enableFeedback: true,
      child: Card(
        margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                myorder.Order_Hash,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                (myorder.Order_Title),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                myorder.Order_Description,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 6.0),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  myorder.Order_Duration==null?'Loading':myorder.Order_Duration,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    child: Text("Deliver Now"),
                    style: TextButton.styleFrom(
                      primary: Colors.orange,
                      backgroundColor: Colors.orange[50],
                    ),
                    onPressed: () =>
                    {
                      print("Deliver Now Button Clicked"),
                      showDialog(
                          context: context,
                          builder: (_) =>
                              AlertDialog(
                                title: Text('Confirm Order'),
                                content:
                                Text('If you have completed the work as per '
                                    'clients requirements.You may deliver'),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        onPressed: () =>
                                        {
                                          print("Cancel Dialog Button"),
                                          Navigator.pop(context)
                                        },
                                        child: Text("Cancel"),
                                        style: TextButton.styleFrom(
                                            primary: Colors.black,
                                            backgroundColor: Colors.grey[200],
                                            minimumSize: Size(30, 30)),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                        {print("Order Confirmed Button")},
                                        child: Text("Confirm"),
                                        style: TextButton.styleFrom(
                                            primary: Colors.white,
                                            backgroundColor: Colors.green,
                                            minimumSize: Size(60, 30)),
                                      ),
                                    ],
                                  )
                                ],
                              ))
                    },
                  ),
                  Text(
                    myorder.Order_Price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Active Products"),
              leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context) ,),
              backgroundColor: Color(0xFF123456),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: orders.map((myorder) => Product_Card_Template_Active(myorder)).toList(),
              ),
            )
        )
    );
  }
}