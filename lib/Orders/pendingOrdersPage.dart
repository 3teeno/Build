import 'package:flutter/material.dart';
import 'Model_Orders.dart';


class pendingOrdersPage extends StatefulWidget {
  const pendingOrdersPage({Key key}) : super(key: key);

  @override
  State<pendingOrdersPage> createState() => _pendingOrdersPageState();
}

class _pendingOrdersPageState extends State<pendingOrdersPage> {

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[Text(
                myorder.Order_Hash,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.blueGrey,
                ),
              ),

                Text(
                  myorder.Order_Duration,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),

              ]
            ),
            SizedBox(height: 6.0),
            Text(
              (myorder.Order_Title),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Color(0xFF115ba6),
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
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 5),child: Text("Awaiting Approval",style: TextStyle(color: Colors.black87,fontSize: 15,fontFamily: 'Poppins'),)),
                Text(
                  myorder.Order_Price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color(0xFF115ba6),
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
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context) ,),
                title: Text("Pending Orders"),
                backgroundColor: Color(0xFF115ba6),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: orders.map((myorder) => Order_Card_Template_Delivered(myorder)).toList(),
                ),
              )
          )
      ),
    );
  }
}
