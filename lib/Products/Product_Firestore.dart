import 'dart:io';
import 'dart:math';

import 'package:build_i_t/Products/Active_Products.dart';
import 'package:build_i_t/Products/Model_Products.dart';
import 'package:build_i_t/auth/firebase_user_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';

String hash;
class Product_Firestore_CRUDS extends StatefulWidget {
  final String hashcode;
  const Product_Firestore_CRUDS({Key key, hashCode, this.hashcode}) : super(key: key);

  @override
  State<Product_Firestore_CRUDS> createState() => _Product_Firestore_CRUDSState(hashCode,hashcode);
}

class _Product_Firestore_CRUDSState extends State<Product_Firestore_CRUDS> {
  String hashcode;
  _Product_Firestore_CRUDSState(hashCode, String hcode) {
    this.hashcode = hcode;
    print("I have recieved the hash : ");
    print(hashcode);
  }
  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _QuantityController = TextEditingController();
  final TextEditingController _PriceController = TextEditingController();
  final TextEditingController _TitleController = TextEditingController();
  final TextEditingController _VendoridController = TextEditingController();
  final TextEditingController _HashController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String new_hash;
    File image;
    String path;
    Reference reference;
    final picker = ImagePicker();
    PickedFile pickedFile;
    Random random = new Random();
    int random_hash = random.nextInt(9999) + 999;
    return Scaffold(
      appBar: AppBar(
        title: Text("New Product"),
        backgroundColor: Color(0xFF115ba6),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              SizedBox(
                width: 50.0,
                height: 10.0,
              ),
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
              SizedBox(
                width: 50.0,
                height: 10.0,
              ),
              TextFormField(
                controller: _DescriptionController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Product Description',
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
                controller: _QuantityController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Quantity',
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
                  labelText: 'Product Price',
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () async {
                    print("Picture Upload button pressed");
                    pickedFile =
                    await picker.getImage(source: ImageSource.gallery);
                  },
                  child: Text("Upload Pictures",style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF115ba6)),
                      minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),
                ),
              ),
              SizedBox(
                width: 50.0,
                height: 10.0,
              ),
              //Add Prodcut Button
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () => {
                    random_hash = random.nextInt(9999) + 999,
                    new_hash = random_hash.toString(),
                    image = new File(pickedFile.path),
                    path = 'productImages/$new_hash/',
                    print(path),
                    reference = FirebaseStorage.instance.ref().child(path),
                    reference.putFile(image).whenComplete(() => print("Image uploaded")),
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
                  },
                  child: Text("Add Product",style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF115ba6)),
                      minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),
                ),
              ),
              SizedBox(
                width: 50.0,
                height: 10.0,
              ),

              //Update Product Data
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () => {
                    Products.update_product(
                      Product_Description: _DescriptionController.text.toString(),
                      Product_Quantity: _QuantityController.text.toString(),
                      my_hash: hashcode.toString(),
                      Product_Vendor_id: currentUser.user.uid.toString(),
                      Product_Price: _PriceController.text.toString(),
                      Product_Title: _TitleController.text.toString(),
                    ),
                    print(hashcode),
                    print("Update Products Pressed")
                  },
                  child: Text("Update Product",style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF115ba6)),
                      minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),
                ),
              ),
              SizedBox(
                width: 50.0,
                height: 10.0,
              ),

              //Delete Product
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () => {
                    Products.delete_product(hashcode.toString()),
                    print("Delete Products Pressed")},
                  child: Text("Delete",style: TextStyle(color: Colors.white),),
                  color: Color(0xFF115ba6),
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
                    print("Fetch Products Pressed"),
                    // Product.fetch_Product().then
                    //   ((value) => setState((){ docs=value; } ) ),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Active_Products_Page(),
                      ),
                    )
                    // print("Checking the final final"),
                    // print(docs),
                  },
                  child: Text("Back",style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF115ba6)),
                      minimumSize: MaterialStateProperty.all(Size(200.0, 40.0))),
                ),
              ),
              SizedBox(
                width: 50.0,
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
