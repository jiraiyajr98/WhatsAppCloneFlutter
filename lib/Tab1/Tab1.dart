import 'package:flutter/material.dart';
import 'package:whats_up_flutter/Chat/UserChat.dart';
import 'package:whats_up_flutter/Models/ChatTypeModel.dart';

class Tab1 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TabState();
  }
}

class _TabState extends State<Tab1>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: Center(
          child: chatViewWidget(getUsers()),
        ),
      ),
    );
  }

  Widget chatViewWidget(List<ChatTypeModel> chatData)
  {
    return new ListView.builder(itemBuilder: (BuildContext context, int index){
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(chatData[index].userImage),
        ),
        title: Text(chatData[index].userName),
        subtitle: Text(chatData[index].lastMessage),
        trailing: new Text(chatData[index].lastMessageTime,style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12
        )),
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(
              builder: (context){
                return UserChat(chatData[index].userName);
              })
          );
        },
      );
    },
      itemCount: chatData.length,
    );
  }

  List<ChatTypeModel> getUsers()
  {
    List<ChatTypeModel> chatTypeList = [];

    ChatTypeModel chatTypeModel = ChatTypeModel(
        "https://pbs.twimg.com/profile_images/1055263632861343745/vIqzOHXj.jpg",
        "User",
        "Last Message",
        true,
        "10:45 pm"
    );

    for(int i = 1; i<=20;i++)
      chatTypeList.add(chatTypeModel);

    return chatTypeList;

  }

}