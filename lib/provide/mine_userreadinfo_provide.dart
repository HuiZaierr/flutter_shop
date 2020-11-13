import 'package:flutter/cupertino.dart';

class MineUserReadInfoProvide with ChangeNotifier {
  String readTime = "";
  int readOff = 0;
  int haveRead = 0;
  int commentNum = 0;
  int exceedNum = 0;

  setUserReadInfo(String readTime, int readOff, int haveRead, int commentNum,
      int exceedNum) {
    this.readTime = readTime;
    this.readOff = readOff;
    this.haveRead = haveRead;
    this.commentNum = commentNum;
    this.exceedNum = exceedNum;
    notifyListeners();
  }
}
