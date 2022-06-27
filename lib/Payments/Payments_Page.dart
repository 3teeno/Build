import 'package:build_i_t/Payments/Payments_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void mainx() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey="pk_test_51LEk1MICXIf9GqmCMvQOSxOdLuYfUJNnTAqpwhyhZGpOSthkjCIJBTQqnHbI9gI38kEk0BktX9PtY5Hbz0mXrWjG00lK4iOIaN";
  print("Called publishableKey");
}
class Payments_Page extends StatefulWidget {
  const Payments_Page({Key key}) : super(key: key);

  @override
  State<Payments_Page> createState() => _Payments_PageState();
}

class _Payments_PageState extends State<Payments_Page> {

  @override
  Widget build(BuildContext context) {
    mainx();
    final paymentController = Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Payments"),
      ),
      body: Column(
        children: <Widget>[
          Icon(
              Icons.credit_card,
            size: 150,
            color: Colors.grey,
          ),
          CardField(
            onCardChanged: (card) async {
             await  print(card);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "£10",
              style: TextStyle(fontSize: 50),
            ),
          ),

          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(textStyle: TextStyle(color: Colors.amber),minimumSize: Size(250, 40)),
              onPressed: ()  async {
                //creating payment method
                // await paymentController.makePayment(amount:'50',currency: 'USD');
                final paymentMethod = await Stripe.instance.createPaymentMethod(PaymentMethodParams.card());
                paymentMethod.printError();

                print("Pay Now Clicked");
                },
              child: Text("Pay Now"),),
          )
        ],
      ),
    );
  }
}
