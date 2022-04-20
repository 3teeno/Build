import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'Model_Orders.dart';

class Delivered_Orders_Page extends StatefulWidget {
  const Delivered_Orders_Page({Key key}) : super(key: key);

  @override
  State<Delivered_Orders_Page> createState() => _Delivered_Orders_PageState();
}

class _Delivered_Orders_PageState extends State<Delivered_Orders_Page> {
  TextEditingController feedbackCOntroller;
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

  Widget Order_Card_Template_Delivered(myorder) {
    return Card(
      margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
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
            ]),
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
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  child: Text("Give Feedback"),
                  style: TextButton.styleFrom(
                    primary: Color(0XFF115ba6),
                    backgroundColor: Color(0xFFF2F2F2),
                  ),
                  onPressed: () => {
                    print("Show Feedback Button Clicked"),
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text(
                                'Give Feedback',
                                style: TextStyle(color: Color(0XFF115ba6)),
                              ),
                              content: TextFormField(
                                controller: feedbackCOntroller,
                                obscureText: false,
                                maxLines: 2,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter feedback';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'Feedback',
                                  labelStyle: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF282828),
                                    lineHeight: 2,
                                  ),
                                  hintStyle: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF282828),
                                    lineHeight: 2,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF282828),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF282828),
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF282828),
                                  lineHeight: 2,
                                ),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () => {
                                        print("Cancel Dialog Button"),
                                        Navigator.pop(context)
                                      },
                                      child: Text("Cancel"),
                                      style: TextButton.styleFrom(
                                          primary: Colors.grey,
                                          // backgroundColor: Colors.grey[200],
                                          minimumSize: Size(30, 30)),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          {print("Order Confirmed Button")},
                                      child: Text("Submit"),
                                      style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Color(0XFF115ba6),
                                          minimumSize: Size(60, 30)),
                                    ),
                                    SizedBox(
                                      width: 20,
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
                      color: Color(0XFF115ba6),
                      decoration: TextDecoration.lineThrough),
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
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text("Delivered Orders"),
                backgroundColor: Color(0XFF115ba6),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: orders
                      .map((myorder) => Order_Card_Template_Delivered(myorder))
                      .toList(),
                ),
              )),
        ));
  }
}
