import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Orders/Model_Orders.dart';
import '../Orders/Order_Firestore.dart';
import '../auth/firebase_user_provider.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;

class Manage_Orders extends StatefulWidget {
  const Manage_Orders({Key key}) : super(key: key);

  @override
  State<Manage_Orders> createState() => _Manage_OrdersState();
}

class _Manage_OrdersState extends State<Manage_Orders> {
  List<Order> orders = [];
  List mydocs = [];
  Future<void> initialise() async {
    await Order.fetch_order_admin().then ((value) => setState((){ mydocs=value; } ) );
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
  Widget Order_Card_Template_Active_Customer(myorder) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Order_Firestore_CRUDS(hashcode: myorder.Order_Hash)));
        },
        enableFeedback: true,
        child: Card(
          margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        myorder.Order_Hash,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.blueGrey,
                        ),
                      ),

                      Text(
                        myorder.Order_Duration==null?'Loading':myorder.Order_Duration,
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
                      child: Text("Active"),
                      style: TextButton.styleFrom(
                        primary: Color(0xFF115ba6),
                        backgroundColor: Color(0xFFF2F2F2),
                      ),
                      onPressed: () =>
                      {
                        print("Active Status Button Clicked"),
                        showDialog(
                            context: context,
                            builder: (_) =>
                                AlertDialog(
                                  title: Text('Confirm Order',style: TextStyle(color: Color(0xFF115ba6)),),
                                  content:
                                  Text('Order is Active',textAlign: TextAlign.start,),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () =>
                                          {
                                            print("Cancel Dialog Button"),
                                            Navigator.pop(context)
                                          },
                                          child: Text("Cancel"),
                                          style: TextButton.styleFrom(
                                              primary: Colors.grey,
                                              // backgroundColor: Colors.grey[200],
                                              minimumSize: Size(30, 30)),
                                        ),
                                        SizedBox(width: 20,),
                                        TextButton(
                                          onPressed: () =>
                                          {print("Order Confirmed Button")},
                                          child: Text("Confirm"),
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: Color(0xFF115ba6),
                                              minimumSize: Size(60, 30)),
                                        ),
                                        SizedBox(width: 20,),
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
                        color: Color(0xFF115ba6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(mydocs.isNotEmpty)
    {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                title: Text("Manage Orders"),
                leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context) ,),
                backgroundColor: Color(0xFF115ba6),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: orders.map((myorder) => Order_Card_Template_Active_Customer(myorder)).toList(),
                ),
              )
          )
      );
    }
    else {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text("Manage Orders"),
              leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context) ,),
              backgroundColor: Color(0xFF115ba6),
            ),
            backgroundColor: Colors.grey[400],
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "No Active Orders Yet",
                    style: TextStyle(
                      fontFamily:"Poppins",
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ),
          )
      );
    }
  }
}


