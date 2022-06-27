

import 'package:build_i_t/Orders/Order_Firestore_add.dart';
import 'package:build_i_t/Payments/Payments_Controller.dart';
import 'package:build_i_t/flutter_flow/chat/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'dart:async';
final scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
void mainx() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey="pk_test_51LEk1MICXIf9GqmCMvQOSxOdLuYfUJNnTAqpwhyhZGpOSthkjCIJBTQqnHbI9gI38kEk0BktX9PtY5Hbz0mXrWjG00lK4iOIaN";
  print("Called publishableKey");
}
class Payments_Page extends StatefulWidget {
  final String price;
  const Payments_Page({Key key,this.price}) : super(key: key);

  @override
  State<Payments_Page> createState() => _Payments_PageState();
}

class _Payments_PageState extends State<Payments_Page> {
  bool payCheck=false;
  @override
  Widget build(BuildContext context) {
    mainx();
    final paymentController = Get.put(PaymentController());
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>add_OrderFireBase())),),
        title: Text("Payments"),
      ),
      body: Column(
        children: <Widget>[
          Icon(
              Icons.credit_card,
            size: 150,
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CardField(
              onCardChanged: (card) async {
               await  print(card);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.price,
              style: TextStyle(fontSize: 50),
            ),
          ),

          Center(
            child: Column(
              children:[
                Text("PKR"),
                SizedBox(height: 15,),
                payCheck?CircularProgressIndicator(): ElevatedButton(
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(color: Colors.amber),minimumSize: Size(250, 40)),
                  onPressed: ()  async {
                    setState(() {
                      payCheck=true;
                    });
                    Timer(Duration(seconds: 3), () {
                      setState(() {
                        payCheck=false;
                      });
                      scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text("Order Added Successfully!"),
                        backgroundColor: Colors.lightGreen,
                      ));

                    });

                    //creating payment method
                    // await paymentController.makePayment(amount:'50',currency: 'USD');
                    final paymentMethod = await Stripe.instance.createPaymentMethod(PaymentMethodParams.card());
                    paymentMethod.printError();

                    print("Pay Now Clicked");
                    paymentController.dispose();
                  },
                  child: Text("Pay Now"),),
              ]
            ),
          )
        ],
      ),
    );
  }
}
