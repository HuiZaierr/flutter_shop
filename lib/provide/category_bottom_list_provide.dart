import 'package:flutter/material.dart';
import '../model/category_bottom.dart';

class CategoryBottomProvide with ChangeNotifier {
  List<CategoryList> categoryBottomList = [];
  int page = 1;
  String noMoreText = '';

  setCategoryBottomList(List<CategoryList> list) {
    categoryBottomList = list;
    notifyListeners();
  }

  addCategoryBottomList(List<CategoryList> list) {
    categoryBottomList.addAll(list);
    notifyListeners();
  }

  setPage(int page) {
    this.page = page;
  }

  addPage() {
    page++;
  }

  setNoMoreText(String noMoreText) {
    this.noMoreText = noMoreText;
    notifyListeners();
  }
}
