import 'package:flutter/material.dart';
import '../model/category_top.dart';

class CategoryProvide with ChangeNotifier {
  List<Categorys> categoryList;
  int id = 0;

  setCategoryList(List list, int id) {
    this.categoryList = list;
    this.id = id;
    notifyListeners();
  }

  setCategoryId(int id) {
    this.id = id;
    notifyListeners();
  }
}
