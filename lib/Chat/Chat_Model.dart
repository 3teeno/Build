import 'package:build_i_t/backend/backend.dart';

class ChatModel{
  String owner;
  ChatModel(String oner)
  {
    owner=oner;
  }
  Future<List<Map<String,String>>> getAllChats()  async {
    CollectionReference chats= FirebaseFirestore.instance.collection('chats');
    CollectionReference users= FirebaseFirestore.instance.collection('users');
    List<Map<String,String>> lst=new List<Map<String,String>>();
    Map<String, String> temp=new Map<String, String> ();
    await for (var AllChats in chats.snapshots())
    {
      for(var indivitual in AllChats.docs){
        if(indivitual.get('user_a')==owner||indivitual.get('user_b')==owner) {
          print("Adding"+indivitual.data().toString());

          if(indivitual.get('user_a').toString()==owner){
            print("Added");
            var user = users.doc(indivitual.get('user_b').toString());
            print(user.toString());
            var value= user.get();
            user.get().then((value) {
              print("Hello there"+value.data());
              temp['name']=value.get('name');
              temp['profile']='https://cdn-icons-png.flaticon.com/512/147/147142.png';
            });
          }
          else if(indivitual.get('user_b').toString()==owner){
            print("Added");
            var user = users.doc(indivitual.get('user_a').toString());
            print(user.toString());
            print(indivitual.get('user_a').toString());
            user.get().then((value) {
              print("Hello there"+value.data());
              temp['name']=value.get('name');
              temp['profile']='https://cdn-icons-png.flaticon.com/512/147/147142.png';
            });
            lst.add(temp);

          }

        }

      }
      print("checking:"+lst.first.toString());


    }
    print("checking:"+lst.first.toString());

    return lst;

  }

}