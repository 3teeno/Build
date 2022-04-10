import 'package:flutter/material.dart';
import 'Model_Orders.dart';


class Delivered_Orders_Page extends StatefulWidget {
  const Delivered_Orders_Page({Key key}) : super(key: key);

  @override
  State<Delivered_Orders_Page> createState() => _Delivered_Orders_PageState();
}

class _Delivered_Orders_PageState extends State<Delivered_Orders_Page> {

  List<Order> orders = [
    Order(
        Order_Hash: '#14251',
        Order_Title: "Painting Service",
        Order_Description:
        "I will paint your entire house that includes 3 Rooms , 1 Dining etc",
        Order_Duration: "5 days",
        Order_Price: "PKR 1040"),
    Order(
        Order_Hash: '#19421',
        Order_Title: "Cleaning Service",
        Order_Description:
        "I will clean your entire house that includes 3 Rooms , 1 Dining etc",
        Order_Duration: "7 days",
        Order_Price: "PKR 9640"),
    Order(
        Order_Hash: '#11251',
        Order_Title: "Electrician Service",
        Order_Description: "I will fix electricity of your house",
        Order_Duration: "3 days",
        Order_Price: "PKR 1040"),
    Order(
        Order_Hash: '#11251',
        Order_Title: "Electrician Service",
        Order_Description: "I will fix electricity of your house",
        Order_Duration: "3 days",
        Order_Price: "PKR 1040"),
    Order(
        Order_Hash: '#11251',
        Order_Title: "Electrician Service",
        Order_Description: "I will fix electricity of your house",
        Order_Duration: "3 days",
        Order_Price: "PKR 1040"),
  ];

  List Order_Grids = [
    "Active",
    "Delivered",
    "Pending",
    "Feedback",
    "Spent",
    "Help"
  ];
  Widget Feedback_Popup_Template(myorder) {
    return Card(
      margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              myorder.Order_Hash,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              myorder.Order_Description,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            // RatingBar(
            //
            //
            //
            // )
          ],

        ),
      ),
    );
  }

  Widget Order_Card_Template_Delivered(myorder)
  {
    return Card(
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
                myorder.Order_Duration,
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
                  child:  Text("Check Feedback"),
                  style: TextButton.styleFrom(
                    primary: Colors.orange,
                    backgroundColor: Colors.orange[50],
                  ),
                  onPressed: ()=>
                  {
                    print("Show Feedback Button Clicked"),
                    showDialog(
                        context: context,
                        builder: (_) => Feedback_Popup_Template(myorder.Order_Hash)
                    )
                  },
                ),
                Text(
                  myorder.Order_Price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.green,
                      decoration: TextDecoration.lineThrough
                  ),
                ),
              ],
            ),

          ],

        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Delivered Orders"),
              backgroundColor: Colors.green,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: orders.map((myorder) => Order_Card_Template_Delivered(myorder)).toList(),
              ),
            )
        )
    );
  }
}
