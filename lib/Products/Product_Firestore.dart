import 'dart:io';
import 'dart:math';

import 'package:build_i_t/Products/Active_Products.dart';
import 'package:build_i_t/Products/Model_Products.dart';
import 'package:build_i_t/auth/firebase_user_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../flutter_flow/flutter_flow_theme.dart';




class Product_Firestore_CRUDS extends StatefulWidget {
  const Product_Firestore_CRUDS({Key key}) : super(key: key);

  @override
  State<Product_Firestore_CRUDS> createState() => _Product_Firestore_CRUDSState();
}

class _Product_Firestore_CRUDSState extends State<Product_Firestore_CRUDS> {

  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _QuantityController = TextEditingController();
  final TextEditingController _PriceController = TextEditingController();
  final TextEditingController _TitleController = TextEditingController();
  final TextEditingController _VendoridController = TextEditingController();
  final TextEditingController _HashController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String new_hash;
    Random random = new Random();
    int random_hash = random.nextInt(9999)+999;
    return Scaffold(
      appBar: AppBar(title: Text("Product CRUDS"),),
      backgroundColor: Colors.blue[200],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(onPressed: () => {
                random_hash = random.nextInt(9999)+999,
                new_hash = random_hash.toString(),
                Products.add_product(
                  Product_Hash: new_hash.toString(),
                  Product_Title: _TitleController.text.toString(),
                  Product_Description: _DescriptionController.text.toString(),
                  Product_Price: _PriceController.text.toString(),
                  Product_Quantity: _QuantityController.text.toString(),
                  Product_Category: "Construction",
                  Product_Vendor_id: currentUser.user.uid.toString(),
                ),
                print("Add Products Pressed"),

              }, child: Text("Add"),style: ButtonStyle( backgroundColor:MaterialStateProperty.all<Color>(Colors.white),minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),),
              SizedBox(width: 50.0, height: 10.0,),
              TextButton(onPressed: () => {
                Products.update_product(
                  Product_Description: _DescriptionController.text.toString(),
                  Product_Quantity: _QuantityController.text.toString(),
                  Product_Hash: new_hash.toString(),
                  Product_Vendor_id: currentUser.user.uid.toString(),
                  Product_Price: _PriceController.text.toString(),
                  Product_Title: _TitleController.text.toString(),
                ),
                print("Update Products Pressed")
              }, child: Text("Update"),style: ButtonStyle( backgroundColor:MaterialStateProperty.all<Color>(Colors.white),minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),),
              SizedBox(width: 50.0, height: 10.0,),
              TextButton(onPressed: () => {print("Delete Products Pressed")}, child: Text("Delete"),style: ButtonStyle( backgroundColor:MaterialStateProperty.all<Color>(Colors.white),minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),),
              SizedBox(width: 50.0, height: 10.0,),
              TextButton(onPressed: () => {

                print("Fetch Products Pressed"),
                // Product.fetch_Product().then
                //   ((value) => setState((){ docs=value; } ) ),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Active_Products_Page(),
                  ),)
                // print("Checking the final final"),
                // print(docs),
              },
                child: Text("Fetch My Products"),style: ButtonStyle( backgroundColor:MaterialStateProperty.all<Color>(Colors.white),minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),),

              SizedBox(width: 50.0, height: 10.0,),
              TextFormField(

                controller: _TitleController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Product Title',
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
              SizedBox(width: 50.0, height: 10.0,),
              TextFormField(
                controller: _DescriptionController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Order Description',
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
              SizedBox(width: 50.0, height: 10.0,),
              TextFormField(
                controller: _QuantityController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Order Duration',
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
              SizedBox(width: 50.0, height: 10.0,),
              TextFormField(

                controller: _PriceController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Order Price',
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
              SizedBox(width: 50.0, height: 10.0,),
          TextButton(onPressed: () =>() async {
            print("Picture Upload button pressed");
            final picker = ImagePicker();
            final pickedFile = await picker.getImage(source: ImageSource. gallery);
            File image = new File(pickedFile.path);
            String path='userImages/$new_hash/';
            var reference = FirebaseStorage.instance.ref().child(path);
            reference.putFile(image);

          },
            child: Text("Upload Pictures"),style: ButtonStyle( backgroundColor:MaterialStateProperty.all<Color>(Colors.white),minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),),
            ],
          ),

        ),
      ),
    );
  }
}
