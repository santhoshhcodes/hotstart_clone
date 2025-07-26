import 'package:flutter/material.dart';


class Fav with ChangeNotifier{
  bool _like = false;

  bool  get like  => _like;

  void toggleFav() {
    _like = !_like;
    notifyListeners();
  }
}