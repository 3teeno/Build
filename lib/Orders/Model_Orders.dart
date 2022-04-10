import 'package:build_i_t/main.dart';

class Order {

  String Order_Hash;
  String Order_Title;
  String Order_Description;
  String Order_Duration;
  String Order_Price;


  Order({this.Order_Hash, this.Order_Title, this.Order_Description, this.Order_Duration, this.Order_Price })
  {
    this.Order_Hash = Order_Hash;
    this.Order_Title = Order_Title;
    this.Order_Price = Order_Price;
    this.Order_Duration = Order_Duration;
    this.Order_Description = Order_Description;

  }

}

