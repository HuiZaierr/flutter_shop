
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/collect_list.dart';

class CollectListProvide with ChangeNotifier{

  int type = -1;
  int page = 1;
  int totalpage = 1;
  List<CollectList> collectList = [];

  setCollectListData(int type ,List<CollectList> collectList,int totalpage){
    this.type = type;
    this.collectList = collectList;
    this.totalpage = totalpage;
    notifyListeners();
  }

  addCollectListData(List<CollectList> list) {
    collectList.addAll(list);
    notifyListeners();
  }

  setPage(int page) {
    this.page = page;
  }

  addPage() {
    page++;
  }


}