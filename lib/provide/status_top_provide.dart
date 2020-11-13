import 'package:flutter/material.dart';
import '../model/category_top.dart';

class StatusProvide with ChangeNotifier {
  List<Status> statusList;
  int id = 0;

  setStatusList(List list, int id) {
    this.statusList = list;
    this.id = id;
    notifyListeners();
  }

  setStatusId(int id) {
    this.id = id;
    notifyListeners();
  }
}
