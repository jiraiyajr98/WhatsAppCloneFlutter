import 'package:flutter/material.dart';
import 'dart:async';
import '../WhatsappHome/WhatsappHome.dart';

class Splash extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }

}

class SplashState extends State<Splash>{

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3),()=>{
      _completeLogin()
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: basicSplashScreen(),
    );
  }

  void _completeLogin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => WhatsUpHome()));
  }

  Widget basicSplashScreen()
  {
    return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getChildrenWidgets(),
          ),
        )
    );
  }

  List<Widget> getChildrenWidgets()
  {
    return <Widget>[
      Expanded(
        flex: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.beach_access,color: Colors.green,size: 130.0,),
          ],
        ),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("from"),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            Text("JIRAIYA" ,
              style: TextStyle(
                  color: Colors.green[600],
                  fontSize: 17.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.all(13.0),
            )
          ],
        ),
      ),
    ];
  }



}

