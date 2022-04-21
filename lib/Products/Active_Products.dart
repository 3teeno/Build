import 'package:flutter/material.dart';
import 'package:build_i_t/Products/Model_Products.dart';

import '../Orders/Model_Orders.dart';
import 'Product_Firestore.dart';

class Active_Products_Page extends StatefulWidget {
  final String hashcode;
  const Active_Products_Page({Key key, this.hashcode}) : super(key: key);

  @override
  State<Active_Products_Page> createState() => _Active_Products_PageState();
}

class _Active_Products_PageState extends State<Active_Products_Page> {
  List<Products> products = [];
  List my_products = [];
  Future<void> initialise() async {
    await Products.fetch_product().then ((value) => setState((){ my_products=value; } ) );
    if(my_products.isEmpty)
      {print("Empty Products Against Vendor");}
    for (var i = 0; i < my_products.length; i++) {
      Products temp = Products(
      Product_Hash: my_products[i]['Product_Hash'],
      Product_Title:my_products[i]['Product_Title'],
      Product_Description: my_products[i]['Product_Description'],
      Product_Quantity: my_products[i]['Product_Quantity'],
      Product_Price: my_products[i]['Product_Price'],
      Product_Vendor_id: my_products[i]['Product_Vendor_id'],);
      products.add(temp);
    }
  }
  Future<void> initState() {
    print("Product Init is called ");
    initialise();
  }
  // Product_Hash
  // Product_Title
  // Product_Description
  // Product_Quantity
  // Product_Price
  // Product_Vendor_id
  // Product_Category
  // Product_Images
  Widget Product_Card_Template_Active(my_product) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Firestore_CRUDS(hashcode: my_product.Product_Hash)));
      },
      enableFeedback: true,
      child: Card(
        margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                my_product.Product_Hash,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                (my_product.Product_Title),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                my_product.Product_Description,
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
                  my_product.Product_Quantity==null?'Loading':my_product.Product_Quantity,
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
                      primary: Color(0xFF115ba6) ,
                      backgroundColor: Color(0xFFf2f2f2),
                    ),
                    onPressed: () =>
                    {
                      print("Deliver Now Button Clicked"),
                      showDialog(
                          context: context,
                          builder: (_) =>
                              AlertDialog(
                                title: Text('Confirm Product'),
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
                                        {print("Product Confirmed Button")},
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
                    my_product.Product_Price,
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
    if(my_products.isNotEmpty)
    {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                title: Text("Active Products"),
                leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context) ,),
                backgroundColor: Color(0xFF115ba6),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: products.map((my_product) => Product_Card_Template_Active(my_product)).toList(),
                ),
              )
          )
      );
    }
    else
    {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text("Active Products"),
              leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context) ,),
              backgroundColor: Color(0xFF115ba6),
            ),
            backgroundColor: Colors.grey[400],
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "No Active Products Yet",
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