import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';

class CurrentIndexProvide with ChangeNotifier {
  int currentIndex = 0;

  changeIndex(int newIndex) {
    this.currentIndex = newIndex;
    notifyListeners();
  }
}
