import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/pages/bookrack_page/collect_page_list_bottom_area.dart';
import 'package:flutter_shop/pages/bookrack_page/collect_page_list_top_area.dart';
import 'package:flutter_shop/pages/bookrack_page/collrct_page_have_data_list_area.dart';
import 'package:flutter_shop/pages/bookrack_page/collrct_page_no_have_data_list_area.dart';
import 'package:flutter_shop/provide/collect_list_provide.dart';
import 'package:flutter_shop/r.dart';
import 'package:provide/provide.dart';

/*
 * 收藏列表数据
 */
class CollectPageListArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<CollectListProvide>(builder: (context,child,value){
      return MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
            children: <Widget>[
               //type = -1时是没有收藏记录
//               value.type == -1?CollectPageListTopArea():Text(""),
//               value.type == -1?CollectPageListBottomArea():Text(""),
               value.type == 1?CollectPageHaveDataListArea():CollectPageNoHaveDataListArea()
            ],
          )
      );
    });

  }
}



