import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Orders/Order_Firestore.dart';
import '../Users/Model_Users.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final CollectionReference _mainCollection = _firestore.collection('users');


class Manage_Users extends StatefulWidget {
  const Manage_Users({Key key}) : super(key: key);

  @override
  State<Manage_Users> createState() => _Manage_UsersState();
}

class _Manage_UsersState extends State<Manage_Users> {
  List<Users> users = [];
  List mydocs = [];
  Future<void> initialise() async {
    await Users.fetch_vendors().then ((value) => setState((){ mydocs=value; } ) );
    for (var i = 0; i < mydocs.length; i++) {
      print("mydocuuuu");
      print(mydocs);
      Users temp = Users(
        users_id: mydocs[i]['users_id'],
        users_name: mydocs[i]['users_name'],
        users_email: mydocs[i]['users_email'],
        users_role: mydocs[i]['users_role'],
        users_phone: mydocs[i]['users_phone'],);
      users.add(temp);
    }
  }
  Future<void> initState() {
    print("Init is called ");
    initialise();
  }
  Widget Users_Card_Template(my_users) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Card(
        margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      my_users.users_name==null?'Loading':my_users.users_name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      my_users.users_phone==null?'Loading':my_users.users_phone,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ]
              ),
              SizedBox(height: 6.0),
              Text(
                (my_users.users_email==null?'Loading':my_users.users_email),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    child: Text(my_users.users_role==null?'Loading':my_users.users_role),
                    style: TextButton.styleFrom(
                      primary: Color(0xFF115ba6),
                      backgroundColor: Color(0xFFF2F2F2),),
                    onPressed: () =>
                    {
                      print("Status Button Clicked"),
                      showDialog(
                          context: context,
                          builder: (_) =>
                              AlertDialog(
                                title: Text('Delete?',style: TextStyle(color: Color(0xFF115ba6)),),
                                content:
                                Text(my_users.users_id,textAlign: TextAlign.start,),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () =>
                                        {
                                          print("Cancel Dialog Button"),
                                          Navigator.pop(context)
                                        },
                                        child: Text("Cancel"),
                                        style: TextButton.styleFrom(
                                            primary: Colors.grey,
                                            minimumSize: Size(30, 30)),
                                      ),
                                      SizedBox(width: 20,),
                                      TextButton(
                                        onPressed: () =>
                                        {
                                          print("User Confirmed Button")},
                                        child: Text("Deactivate"),
                                        style: TextButton.styleFrom(
                                            primary: Colors.white,
                                            backgroundColor: Color(0xFF115ba6),
                                            minimumSize: Size(60, 30)),
                                      ),
                                      SizedBox(width: 20,),
                                    ],
                                  )
                                ],
                              ))
                    },
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
    if(mydocs.isNotEmpty)
    {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                title: Text("Manage Users"),
                leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context) ,),
                backgroundColor: Color(0xFF115ba6),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: users.map((my_users) => Users_Card_Template(my_users)).toList(),
                ),
              )
          )
      );
    }
    else {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text("Manage Users"),
              leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context) ,),
              backgroundColor: Color(0xFF115ba6),
            ),
            backgroundColor: Colors.grey[400],
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "No Users Yet",
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





