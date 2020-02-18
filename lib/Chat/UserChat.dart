import 'package:flutter/material.dart';
import 'package:whats_up_flutter/Models/ChatModel.dart';

class UserChat extends StatefulWidget{

  UserChat(this.userName);
  final String userName;

  @override
  State<StatefulWidget> createState() {
    return new UserChatState();
  }

}

class UserChatState extends State<UserChat>{

  final scaffoldContext = GlobalKey<ScaffoldState>();
  final inputMessageTextController = TextEditingController();
  List<ChatModel> chatList = [];
  ScrollController _scrollController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {

    });
    chatList.addAll(chatMessages());
  }

  @override
  void dispose() {
    inputMessageTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldContext,
      appBar: new AppBar(
        title: Text(widget.userName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              child: getChatView(chatList),
            ),
          ),
          editTextWidget()
        ],
      ),
    );
  }

  Widget getChatView(List<ChatModel> chatList)
  {
    return ListView.builder(
      controller: _scrollController,
      itemCount: chatList.length,
        itemBuilder: (BuildContext context,int index){
          return chatList[index].messageType == 0 ?
          getUserChatWidget(chatList[index]):getFriendChatWidget(chatList[index]);
        }
    );
  }

  Widget getUserChatWidget(ChatModel chatModel)
  {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 130.0),
                        child: createUserChatMessageUi(chatModel.message)
                    )
                )
              ],
          )

        ],
      ),
    );
  }

  Widget getFriendChatWidget(ChatModel chatModel)
  {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
       children: <Widget>[
         Flexible(
           child: Padding(
             padding: EdgeInsets.only(right: 130.0),
             child: ClipPath(
               clipper: UserFriendClipper(),
               child: Container(
                   color: Color.fromRGBO(240, 240, 240, 1),
                   padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                   child: Text(chatModel.message)
               ),
             ),
           ),
         ),
       ],
      ),
    );
  }


  Widget createUserChatMessageUi(String message){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ClipPath(
        clipper: UserChatClipper(),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(220, 248, 198,1)
          ),
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              child: Text(message),
            ),
          ),
        ),
      )
    );
  }
  

  Widget editTextWidget()
  {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(3.0),
      child:Row(
        children: <Widget>[
          Flexible(
            flex: 10,
            child: createEnterMessageWidget(),
          ),
          Flexible(
            flex: 1,
            child: createButton(),
          )
        ],
      )
    );
  }

  Widget createButton()
  {
    return IconButton(
      onPressed: (){

      setState(() {
        chatList.insert(chatList.length
        ,ChatModel(inputMessageTextController.text,0,0));
        inputMessageTextController.clear();
        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + 50,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut);
      });

      },
      icon: Icon(Icons.send,color: Colors.green,),
    );
  }

  Widget createEnterMessageWidget()
  {
    return TextField(
      controller: inputMessageTextController,
      decoration: InputDecoration(
        fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.tag_faces),
          hintText: 'Type a message',
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0
              )
          ),
       focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(
               color: Colors.white,
               width: 2.0
           )
       ),
      ),
    );
  }

  List<ChatModel> chatMessages()
  {
    return <ChatModel>[
      ChatModel("How are You ? WOWO jkadnsdknakndklansdandjknaksdna aksdjasodhjaisdhiashdiahdiashudilahusdiauhsdilahudiauhsdilhasidhuaislhuuhsdoahsauihdilashud",0,0),
      ChatModel("How are You ? WOWO jkadnsdknakndklansdandjknaksdna aksdjasodhjaisdhiashdiahdiashudilahusdiauhsdilahudiauhsdilhasidhuaislhuuhsdoahsauihdilashud",0,1),

    ];
  }

}

class UserChatClipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    var clip = Path();
    clip.lineTo(0, size.height);
    clip.lineTo(size.width -10, size.height+10);
    clip.lineTo(size.width -10, 10);
    clip.lineTo(size.width,0) ;

    return clip;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}

class UserFriendClipper extends CustomClipper<Path>{

  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(10, 10);
    path.lineTo(10, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;

  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }

}