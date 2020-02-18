import "package:flutter/material.dart";
import 'package:whats_up_flutter/Splash/Splash.dart';

void main() => runApp(new MaterialApp(
  title: "WhatsUp",
  theme: new ThemeData(
    primaryColor: Color.fromRGBO(29, 139, 126, 1),
  ),
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Splash();
  }

}
