import 'dart:async';

import 'package:build_i_t/Build%20Your%20Home/phaseThree.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../home_page/CustomerHomePage.dart';
import 'buildYourHome_Data.dart';

class phasePageTwo extends StatefulWidget {
  const phasePageTwo({Key key}) : super(key: key);

  @override
  _phasePageTwoState createState() => _phasePageTwoState();
}

class _phasePageTwoState extends State<phasePageTwo> {
  int _activeStepIndex = 0;
  bool isExpanded = true;
  bool welldoneTimer = true;
  void gotoSecondPhase() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => phasePageThree()));
  }

  Widget textWithWrap(String no) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 15,
        ),
        ConstrainedBox(
          constraints: byhdTwo[no]["isExpanded"]
              ? BoxConstraints(maxHeight: 60)
              : BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Text(
            byhdTwo[no]["data"],
            softWrap: true,
            overflow: TextOverflow.fade,
            style: TextStyle(fontSize: 18),
          ),
        ),
        byhdTwo[no]["isExpanded"]
            ? FlatButton(
                onPressed: () {
                  setState(() {
                    byhdTwo[no]["isExpanded"] = false;
                  });
                },
                child: Text("Show More"))
            : FlatButton(
                onPressed: () {
                  setState(() {
                    byhdTwo[no]["isExpanded"] = true;
                  });
                },
                child: Text("Show Less"))
      ],
    );
  }

  List<Step> stepList() => [
        //Phase One
        Step(
            title: Text(
              byhdTwo["1"]["title"],
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
                      color: Color(0xFF123456)),
                  child: Image.asset(
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("1"),
              ],
            )),
        Step(
            title: Text(byhdTwo["2"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("2"),
              ],
            )),
        Step(
            title: Text(byhdTwo["3"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("3"),
              ],
            )),
        Step(
            title: Text(byhdTwo["4"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("4"),
              ],
            )),
        Step(
            title: Text(byhdTwo["5"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("5"),
              ],
            )),
        Step(
            title: Text(byhdTwo["6"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("6"),
              ],
            )),
        Step(
            title: Text(byhdTwo["7"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("7"),
              ],
            )),
        Step(
            title: Text(byhdTwo["8"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("8"),
              ],
            )),
        Step(
            title: Text(byhdTwo["9"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("9"),
              ],
            )),
        Step(
            title: Text(byhdTwo["10"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("10"),
              ],
            )),
        Step(
            title: Text(byhdTwo["11"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("11"),
              ],
            )),
        Step(
            title: Text(byhdTwo["12"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("12"),
              ],
            )),
        Step(
            title: Text(byhdTwo["13"]["title"]),
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
                    "assets/images/phase_one_main_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Text Show less column
                textWithWrap("13"),
              ],
            )),
      ];
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
                  children: [
                    if (byhdTwo[(_activeStepIndex + 1).toString()]
                        ["isComplete"])
                      RaisedButton(
                        color: Colors.lightGreen,
                        onPressed: () {
                          setState(() {
                            if (_activeStepIndex < stepList().length - 1) {
                              _activeStepIndex += 1;
                            } else {
                              print("On the last step now");
                              Timer(Duration(seconds: 2), () {
                                gotoSecondPhase();
                              });
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      contentPadding: EdgeInsets.only(top: 10),
                                      content: Container(
                                        height: 250,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Lottie.asset(
                                                "assets/lottie_animations/welldone.json",
                                                height: 200,
                                                width: 200,
                                                repeat: true),
                                            Text(
                                              "You have Completed Phase One",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins'),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                          });
                        },
                        child: Text("Completed"),
                      )
                    else
                      RaisedButton(
                          color: Color(0xFF282828),
                          onPressed: () {
                            setState(() {
                              // byhdTwo[(_activeStepIndex+1).toString()]["isComplete"]=true;
                              byhdTwo[(_activeStepIndex + 1).toString()]
                                  .update("isComplete", (value) => true);
                              if (_activeStepIndex < stepList().length - 1) {
                                _activeStepIndex += 1;
                              } else {
                                print("On the last step now");
                                Timer(Duration(seconds: 2), () {
                                  gotoSecondPhase();
                                });
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        contentPadding:
                                            EdgeInsets.only(top: 10),
                                        content: Container(
                                          height: 250,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Lottie.asset(
                                                  "assets/lottie_animations/welldone.json",
                                                  height: 200,
                                                  width: 200,
                                                  repeat: true),
                                              Text(
                                                "You have Completed Phase One",
                                                style: TextStyle(
                                                    fontFamily: 'Poppins'),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            });
                          },
                          child: (stepList().length - 1 == _activeStepIndex)
                              ? Text(
                                  "Go to Next Phase",
                                  style: TextStyle(color: Colors.white),
                                )
                              : Text(
                                  "Complete",
                                  style: TextStyle(color: Colors.white),
                                )),
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
