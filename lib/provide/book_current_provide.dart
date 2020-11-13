import 'package:flutter/cupertino.dart';

class BookCurrentIndexProvide with ChangeNotifier {
  int currentIndex = 0;

  setCurrentIndex(int index) {
    this.currentIndex = index;
    notifyListeners();
  }
}
