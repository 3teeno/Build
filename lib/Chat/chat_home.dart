



import 'package:build_i_t/Chat/Chat_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  Future<List<Map<String, String>>> getList() async {
    print("I am in");
    ChatModel model = new ChatModel('mateen');
    print("I am in");

    Future<List<Map<String,String>>> ref;
    print("I am iwith it");
    print(ref);
    ref= model.getAllChats();

    print(ref.toString());
    return ref;
  }
  @override

  Widget Chat_Card_Template(mychats)
  {
    return Card(
      margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              mychats['name'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.blueGrey,
              ),
            ),
          ],

        ),
      ),
    );
  }




  Widget build(BuildContext context) {
    return new Scaffold(

          body:
            Column(
              children: [
                FutureBuilder(
                  future: getList(),
                  builder: (BuildContext context, AsyncSnapshot<List<Map<String,String>>> chats) {
                    List<Widget> chat=new List<Widget>();
                    print(chats);
                    for (var indivitual in chats.data) {
                        chat.add(Chat_Card_Template(indivitual));
                    }

                    return  new Column(
                      children: chat,
                    );
                  },
                ),
              ],
            ),


    );
  }
}
