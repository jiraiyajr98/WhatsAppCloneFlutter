import 'package:flutter/material.dart';

class Tab2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TabState();
  }
}

class _TabState extends State<Tab2>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: Center(
          child: Text("TAB2"),
        ),
      ),
    );
  }

}