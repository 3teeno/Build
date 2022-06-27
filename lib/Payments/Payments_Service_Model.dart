import 'package:flutter_stripe/flutter_stripe.dart';
class PaymentService {
  final int amount;
  final String url;

  PaymentService({
    this.amount=10,
    this.url='',
  });
  static init()
  {

  }
}