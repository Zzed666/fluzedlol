import 'package:d_stack/d_stack.dart';
import 'package:flutter/material.dart';

class LolMainPage extends StatefulWidget {
  @override
  _LolMainPageState createState() => _LolMainPageState();
}

class _LolMainPageState extends State<LolMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LolMainPage"),
        ),
        body: Center(
            child: FlatButton(
                onPressed: () {
                  DStack.present("login/", PageType.flutter);
                },
                child: Text("123"))));
  }
}
