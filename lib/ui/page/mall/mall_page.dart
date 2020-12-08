import 'package:flutter/material.dart';

class MallPage extends StatefulWidget {
  @override
  _MallPageState createState() => _MallPageState();
}

class _MallPageState extends State<MallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("mall page"),),
      body: Center(
        child: Text("mall page"),
      )
    );
  }
}
