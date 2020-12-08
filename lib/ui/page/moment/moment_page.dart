import 'package:flutter/material.dart';

class MomentPage extends StatefulWidget {
  @override
  _MomentPageState createState() => _MomentPageState();
}

class _MomentPageState extends State<MomentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("moment page"),),
      body: Center(
        child: Text("moment page"),
      )
    );
  }
}
