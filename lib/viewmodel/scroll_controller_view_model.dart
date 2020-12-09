import 'package:flutter/material.dart';

class TapToTopViewModel with ChangeNotifier {
  ScrollController _scrollController;
  double _height;
  bool _isOnTop = false;
  ScrollController get scrollController => _scrollController;
  bool get isOnTop => _isOnTop;
  TapToTopViewModel(this._scrollController, {double height: 200}) {
    _height = height;
  }
  init() {
    _scrollController?.addListener(() {
      if (_scrollController.offset > _height && !_isOnTop) {
        _isOnTop = true;
        notifyListeners();
      } else if (_scrollController.offset < _height && _isOnTop) {
        _isOnTop = false;
        notifyListeners();
      }
    });
  }

  scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(milliseconds: 300), curve: Curves.easeOutCubic);
  }
}