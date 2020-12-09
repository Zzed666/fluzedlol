import 'package:flutter/material.dart';

class LolMainViewModel with ChangeNotifier {
  int bottomSelectIndex = 0;

  updateBottomSelectIndex(int index) {
    bottomSelectIndex = index;
    notifyListeners();
  }
}