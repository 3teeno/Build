import 'package:build_i_t/backend/backend.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'Model_Orders.dart';

class Delivered_Vendor_Orders_Page extends StatefulWidget {
  const Delivered_Vendor_Orders_Page({Key key}) : super(key: key);

  @override
  State<Delivered_Vendor_Orders_Page> createState() => _Delivered_Vendor_Orders_PageState();
}

class _Delivered_Vendor_Orders_PageState extends State<Delivered_Vendor_Orders_Page> {
  TextEditingController feedbackController=new TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Order> orders = [];
  List mydocs = [];
  Future<void> initialise() async {
    await Order.fetch_completed_vendor_order().then((value) => setState(() {
      mydocs = value;
    }));
    for (var i = 0; i < mydocs.length; i++) {
      Order temp = Order(
        Order_Hash: mydocs[i]['Order_Hash'],
        Order_Title: mydocs[i]['Order_Title'],
        Order_Duration: mydocs[i]['Order_Duration'],
        Order_Description: mydocs[i]['Order_Description'],
        Order_Price: mydocs[i]['Order_Price'],
        Order_Status: mydocs[i]['Order_Status'],
        Order_ID: mydocs[i]['Order_ID'],
      );
      orders.add(temp);
    }
  }

  Future<void> initState() {
    print("Init is called ");
    initialise();
  }

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
                            controller: feedbackController,
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
                              labelStyle:
                              FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF282828),
                                lineHeight: 2,
                              ),
                              hintStyle:
                              FlutterFlowTheme.bodyText1.override(
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
                                  onPressed: () => {
                                    print("Feedback Submitted"),
                                    //code to send feedback to firebase
                                    print("Order Confirmed Button"),
                                    //print(feedbackController.value.text),
                                    FirebaseFirestore.instance.doc(
                                        "orders/" + myorder.Order_ID).update({"feedback":feedbackController.value.text}),
                                    Navigator.pop(context),
                                  },
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
