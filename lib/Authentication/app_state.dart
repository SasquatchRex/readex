import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String globalVariable = "";

  void updateGlobalVariable(String newValue) {
    globalVariable = newValue;
    notifyListeners();
  }
}