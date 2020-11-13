import 'package:flutter/material.dart';
import '../model/category_top.dart';

class SortProvide with ChangeNotifier {
  List<Sort> sortList;
  int id = 0;

  setSortList(List list, int id) {
    this.sortList = list;
    this.id = id;
    notifyListeners();
  }

  setSortId(int id) {
    this.id = id;
    notifyListeners();
  }
}
