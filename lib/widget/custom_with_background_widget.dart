import 'package:flutter/material.dart';

class CustomWithBackGroundWidget extends StatelessWidget {
  final Widget childWidget;
  final double bgImgOpacity;
  final ImageProvider imageProvider;

  CustomWithBackGroundWidget(
      {this.imageProvider: const AssetImage("images/img_lol_bg.png"),
      @required this.childWidget,
      this.bgImgOpacity: 1.0});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Opacity(
          opacity: bgImgOpacity,
          child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover)))),
      childWidget
    ]);
  }
}
