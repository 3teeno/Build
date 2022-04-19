import 'dart:async';

import 'package:build_i_t/Build%20Your%20Home/buildYourHome_Data.dart';
import 'package:build_i_t/Build%20Your%20Home/phaseTwo.dart';
import 'package:build_i_t/backend/backend.dart';
import 'package:build_i_t/home_page/CustomerHomePage.dart';
import 'package:build_i_t/home_page/homepage_header.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../flutter_flow/flutter_flow_theme.dart';

import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

final CollectionReference _mainCollection = _firestore.collection('guide');
final CollectionReference _mainCollectionbyhd = _firestore.collection('guide/byhd');
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
class phasesPageMain extends StatefulWidget {
  const phasesPageMain({Key key}) : super(key: key);

  @override
  _phasesPageMainState createState() => _phasesPageMainState();
}

class _phasesPageMainState extends State<phasesPageMain> {
  int _activeStepIndex = 0;
  bool isExpanded = true;
  bool welldoneTimer = true;
  bool isComplete = false;
  void gotoSecondPhase() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => phasePageTwo()));
  }

  Widget textWithWrap(String no) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 15,
        ),
        ConstrainedBox(
          constraints: byhd[no]["isExpanded"]
              ? BoxConstraints(maxHeight: 60)
              : BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Text(
            byhd[no]["data"],
            softWrap: true,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
        byhd[no]["isExpanded"]
            ? FlatButton(
                onPressed: () {
                  setState(() {
                    byhd[no]["isExpanded"] = false;
                  });
                },
                child: Text("Show More"))
            : FlatButton(
                onPressed: () {
                  setState(() {
                    byhd[no]["isExpanded"] = true;
                  });
                },
                child: Text("Read Less"))
      ],
    );
  }

  createValues()async{
    // Query query = await _mainCollection.where('Order_Hash',isEqualTo: '9999');
    // query.get().then((querySnapshot) => { querySnapshot.docs.forEach((element) {
    //   print(element.reference.id);})
    // });
    DocumentReference documentReference=_mainCollection.doc(user.uid);
    Map<String, dynamic> data = <String, dynamic>{
      "1" : 0,
      "2": 0,
      "3": 0,
      "4": 0,
      "5": 0,
      "6": 0,
      "7": 0,
      "8": 0,
      "9": 0,
      "10": 0,
      "11": 0,
      "12": 0,
      "13": 0,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("New Order added to the database"))
        .catchError((e) => print(e));
  }



  //DatabaseReference databaseReference;
  @override
  void initState() {
    // TODO: implement initState

   createValues();

    //
  }



  Widget callingActionButton(String value, int index) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
      child: FFButtonWidget(
        onPressed: () async {
          //first button
          if (index == 1) {
            //checking null or zero

            // final snapshot =
            //     await databaseReference.child("byhd").child("1").get();
            // if (snapshot.exists) {
            //   if (snapshot.value == 0) {
            //     databaseReference.child("byhd").child("1").set(1);
            //   }
            //   print(snapshot.value);
            // } else {}
          }
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => HomePageWidget()));
        },
        text: value,
        options: FFButtonOptions(
          width: MediaQuery.of(context).size.width * 0.43,
          height: 35,
          color: Color(0xFF282828),
          textStyle: FlutterFlowTheme.subtitle2.override(
            fontFamily: 'Poppins',
            color: Color(0xFFFFB700),
            fontWeight: FontWeight.normal,
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: 2,
        ),
      ),
    );
  }

  List<Step> stepList() => [
        //Phase One
        Step(
            title: Text(
              byhd["1"]["title"],
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                        Lottie.asset("assets/lottie_animations/planning.json")),
                //Text Show less column
                textWithWrap("1"),
                callingActionButton("Find Contractor", 1)
              ],
            )),
        Step(
            title: Text(byhd["2"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text Show less column
                textWithWrap("2"),
              ],
            )),
        Step(
            title: Text(byhd["3"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF123456)),
                  child: Image.asset(
                    "assets/images/Excavation.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("3"),
                callingActionButton("Find Excavator", 2),
              ],
            )),
        Step(
            title: Text(byhd["4"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF123456)),
                  child: Image.asset(
                    "assets/images/survayer.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("4"),
              ],
            )),
        Step(
            title: Text(byhd["5"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF123456)),
                  child: Image.asset(
                    "assets/images/base.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("5"),
              ],
            )),
        Step(
            title: Text(byhd["6"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text Show less column
                textWithWrap("6"),
              ],
            )),
        Step(
            title: Text(byhd["7"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text Show less column
                textWithWrap("7"),
              ],
            )),
        Step(
            title: Text(byhd["8"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF123456)),
                  child: Image.asset(
                    "assets/images/framing_inspection.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("8"),
              ],
            )),
        Step(
            title: Text(byhd["9"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF123456)),
                  child: Image.asset(
                    "assets/images/Exterior Finishes.jfif",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("9"),
              ],
            )),
        Step(
            title: Text(byhd["10"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF123456)),
                  child: Image.asset(
                    "assets/images/Insulation.jfif",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("10"),
              ],
            )),
        Step(
            title: Text(byhd["11"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF123456)),
                  child: Image.asset(
                    "assets/images/Sheetrock.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("11"),
              ],
            )),
        Step(
            title: Text(byhd["12"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF123456)),
                  child: Image.asset(
                    "assets/images/Exterior Siding.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("12"),
              ],
            )),
        Step(
            title: Text(byhd["13"]["title"]),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF123456)),
                  child: Image.asset(
                    "assets/images/Exterior Driveway Walkway.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("13"),
              ],
            )),
      ];
//complete or Completed

  // getData(int _activeIndex){
  //
  //   reference.onValue.listen((event) {
  //     final data = event.snapshot.value;
  //     return data;
  //   });
  // }


  Widget getCompleteWidget(int _activeIndex) {
    // DatabaseReference reference = FirebaseDatabase.instance.ref("byhd");
    // if(reference==null){
    //
    // }


//     final value=getData(_activeIndex);
// print(getData(_activeIndex));
//     return Text(value.toString());
//     print(value);
    // if (value == 1) {
    //   return RaisedButton(
    //     color: Colors.lightGreen,
    //     onPressed: () {
    //       setState(() {
    //         if (_activeStepIndex < stepList().length - 1) {
    //           _activeStepIndex += 1;
    //         } else {
    //           print("On the last step now");
    //           Timer(Duration(seconds: 2), () {
    //             gotoSecondPhase();
    //           });
    //           showDialog(
    //               context: context,
    //               builder: (context) {
    //                 return AlertDialog(
    //                   shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.all(Radius.circular(8))),
    //                   contentPadding: EdgeInsets.only(top: 10),
    //                   content: Container(
    //                     height: 250,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         Lottie.asset(
    //                             "assets/lottie_animations/welldone.json",
    //                             height: 200,
    //                             width: 200,
    //                             repeat: true),
    //                         Text(
    //                           "You have Completed Phase One",
    //                           style: TextStyle(fontFamily: 'Poppins'),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               });
    //         }
    //       });
    //     },
    //     child: Text("Completed"),
    //   );
    // }
    // if(value==0){
    //   return RaisedButton(
    //             color: Color(0xFF282828),
    //             onPressed: () {
    //               setState(() {
    //                 if (_activeStepIndex < stepList().length - 1) {
    //                   _activeStepIndex += 1;
    //                   reference.set(1);
    //                 } else {
    //                   print("On the last step now");
    //                   Timer(Duration(seconds: 2), () {
    //                     gotoSecondPhase();
    //                   });
    //                   showDialog(
    //                       context: context,
    //                       builder: (context) {
    //                         return AlertDialog(
    //                           shape: RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.all(
    //                                   Radius.circular(8))),
    //                           contentPadding:
    //                               EdgeInsets.only(top: 10),
    //                           content: Container(
    //                             height: 250,
    //                             child: Column(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.center,
    //                               crossAxisAlignment:
    //                                   CrossAxisAlignment.center,
    //                               children: [
    //                                 Lottie.asset(
    //                                     "assets/lottie_animations/welldone.json",
    //                                     height: 200,
    //                                     width: 200,
    //                                     repeat: true),
    //                                 Text(
    //                                   "You have Completed Phase One",
    //                                   style: TextStyle(
    //                                       fontFamily: 'Poppins'),
    //                                 )
    //                               ],
    //                             ),
    //                           ),
    //                         );
    //                       });
    //                 }
    //               });
    //             },
    //             child: (stepList().length - 1 == _activeStepIndex)
    //                 ? Text(
    //                     "Go to Next Phase",
    //                     style: TextStyle(color: Colors.white),
    //                   )
    //                 : Text(
    //                     "Complete",
    //                     style: TextStyle(color: Colors.white),
    //                   ));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePageWidget())),
          ),
          backgroundColor: Color(0xFFF6EFDE),
          elevation: 0,
          title: Text(
            "Build Your Home",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        backgroundColor: Color(0xFFF6EFDE),
        body: Theme(
            data: ThemeData(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: Color(0xFFF6EFDE), secondary: Color(0xFFF6EFDE))),
            child: Stepper(
              currentStep: _activeStepIndex,
              steps: stepList(),
              elevation: 0,
              controlsBuilder: (context, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("nhjv"),


                    SizedBox(
                      width: 10,
                    ),
                    (stepList().length - 1 == _activeStepIndex ||
                            _activeStepIndex == 0)
                        ? Text("")
                        : TextButton(
                            onPressed: () {
                              setState(() {
                                if (_activeStepIndex > 0) {
                                  _activeStepIndex -= 1;
                                } else {
                                  print("On the last step now");
                                }
                              });
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.grey),
                            )),
                  ],
                );
              },
            )),
      ),
    );
  }
}
