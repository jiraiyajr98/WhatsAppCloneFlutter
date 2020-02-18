import 'package:whats_up_flutter/Tab1/Tab1.dart';
import 'package:whats_up_flutter/Tab2/Tab2.dart';
import 'package:whats_up_flutter/Tab3/Tab3.dart';
import "package:flutter/material.dart";

class WhatsUpHome extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new WhatsUpHomeState("WhatsUp");
  }
}

class WhatsUpHomeState extends State<WhatsUpHome> with SingleTickerProviderStateMixin{

  final String title;
  WhatsUpHomeState(this.title);

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        bottom: new TabBar(
            controller: _tabController,
            tabs: <Tab>[
              new Tab(text: "CHATS"),
              new Tab(text: "STATUS"),
              new Tab(text: "CALLS")
            ]),
      ),
      body: new TabBarView(children: <Widget>[
        new Tab1(),
        new Tab2(),
        new Tab3()
      ],
        controller: _tabController,
      ),
    );
  }

}