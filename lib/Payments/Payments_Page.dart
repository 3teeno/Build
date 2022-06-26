import 'package:build_i_t/Payments/Payments_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey="pk_test_51LEco2LPOi7sC4PNJH5i50go7WI7n9kCthth0aeegovTl6iAFk2pIb2oaFjahXeEUmUiikH1maucBZ3NggbD2MdA00KvUTag1o";
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
    main();
    final paymentController = Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Payments"),
      ),
      body: Column(
        children: <Widget>[
          CardField(
            onCardChanged: (card) {
              print(card);
            },
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(textStyle: TextStyle(color: Colors.amber),minimumSize: Size(250, 40)),
              onPressed: () async {
                //creating payment method
                final paymentMethod = await Stripe.instance.createPaymentMethod(PaymentMethodParams.card());
                // paymentController.makePayment(amount:'5',currency: 'USD');
                print("Pay Now Clicked");
                await Stripe.instance.presentPaymentSheet();
                },
              child: Text("Pay Now"),),
          )
        ],
      ),
    );
  }
}
