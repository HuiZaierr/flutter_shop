
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/collect_list.dart';
import 'package:flutter_shop/model/history_list.dart';

class HistoryListProvide with ChangeNotifier{

  int type = -1;
  int page = 1;
  int totalpage = 1;
  List<HistoryList> historyList = [];

  setCollectListData(int type ,List<HistoryList> historyList,int totalpage){
    this.type = type;
    this.historyList = historyList;
    this.totalpage = totalpage;
    notifyListeners();
  }

  addCollectListData(List<HistoryList> list) {
    historyList.addAll(list);
    notifyListeners();
  }

  setPage(int page) {
    this.page = page;
  }

  addPage() {
    page++;
  }


}