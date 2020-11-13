import 'package:flutter/material.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/pages/bookrack_page/history_page_empty_area.dart';
import 'package:flutter_shop/pages/bookrack_page/history_page_list_area.dart';
import 'package:flutter_shop/provide/history_list_provide.dart';
import 'package:provide/provide.dart';

/*
 * 历史页面
 */
class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<HistoryListProvide>(builder: (context,child,value){
      return value.type == -1? HistoryPageEmptyArea():HistoryPageListArea();
    });
  }
}


