import 'dart:math';
import 'package:flutter/material.dart';
import 'Model_Orders.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';


String hash;
String Ordertitle,Orderdescription,orderDuration,orderPrice;

class Order_Firestore_CRUDS extends StatefulWidget {
  final String hashcode;
  const Order_Firestore_CRUDS({Key key, hashCode, this.hashcode}) : super(key: key);


  @override
  State<Order_Firestore_CRUDS> createState() => _Order_Firestore_CRUDSState(hashCode,hashcode);
}

class _Order_Firestore_CRUDSState extends State<Order_Firestore_CRUDS> {
  bool isEdit=false;
  String hashcode;
  _Order_Firestore_CRUDSState(hashCode, String hcode) {
    this.hashcode=hcode;
    print("I have recieved the hash : ");
    print(hashcode);
  }
  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _DurationController= TextEditingController();
  final TextEditingController _PriceController = TextEditingController();
  final TextEditingController _TitleController = TextEditingController();
  final TextEditingController _HashController = TextEditingController();
  Order myorder;
  @override
  Widget build(BuildContext context) {
    _HashController.text=hashcode;
    String newHash=hashcode;
    Random random = new Random();
    int randomHash = random.nextInt(9999) + 999;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Modify Order"),
          backgroundColor: Color(0XFF115ba6),
        ),
        backgroundColor: Color(0xFFffffff),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "#"+hashcode
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _TitleController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Order Title",
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    hintText: 'I will do this for you....',
                    hintStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF282828),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF282828),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 50.0,
                  height: 10.0,
                ),
                TextFormField(
                  controller: _DescriptionController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Order Description",
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    hintText: 'Add your Description Here',
                    hintStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF282828),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF282828),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 50.0,
                  height: 10.0,
                ),
                TextFormField(
                  controller: _DurationController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Order Duration",
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    hintText: '3 Days',
                    hintStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF282828),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF282828),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 50.0,
                  height: 10.0,
                ),
                TextFormField(
                  controller: _PriceController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Order Price",
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    hintText: 'PKR 500',
                    hintStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF282828),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF282828),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF282828),
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 50.0,
                  height: 10.0,
                ),
                //Update Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    color: Color(0XFF115ba6),
                    onPressed: () => {
                      Order.update_order(
                        Order_Description: _DescriptionController.text.toString(),
                        Order_Duration: _DurationController.text.toString(),
                        my_hash: newHash.toString(),
                        Order_Vendor_id: user.uid.toString(),
                        Order_Price: _PriceController.text.toString(),
                        Order_Title: _TitleController.text.toString(),
                      ),
                      print("Update Orders Pressed")
                    },
                    child: Text("Update",style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                  height: 10.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () => {
                      print("Delete Orders Pressed"),
                      Order.delete_order(newHash),
                    },
                    child: Text("Delete",style: TextStyle(color: Colors.white),),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent),
                        minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),
                  ),
                )



              ],
            ),
          ),
        ),

      ),
    );
  }

  Widget TextArea({String orderTitle,String orderDiscription,String orderDuration,String orderPrice}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          //Order Title
          Text("Order Title"),
          SizedBox(
            height: 10.0,
          ),
          Text(
            orderTitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          //Order Discription
          Text("Order Description"),
          SizedBox(
            height: 10.0,
          ),
          Text(
            orderDiscription,
            maxLines: 4,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          //Order Duration
          Text("Order Duration"),
          SizedBox(
            height: 10.0,
          ),
          Text(
            orderDuration,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          //Order Price
          Text("Order Price"),
          SizedBox(
            height: 10.0,
          ),
          Text(
            orderPrice,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget TextFormArea({String orderTitle,String orderDiscription,String orderDuration,String orderPrice,String new_hash}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      ),
    );
  }
}
