import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/constans.dart';
import 'package:flutter_shop/pages/category_page/category_bottom_list.dart';
import 'package:flutter_shop/pages/category_page/category_top_one.dart';
import 'package:flutter_shop/pages/category_page/category_top_textfield.dart';
import 'package:flutter_shop/pages/category_page/category_top_three.dart';
import 'package:flutter_shop/pages/category_page/category_top_two.dart';
import 'package:flutter_shop/provide/category_top_provide.dart';
import 'package:flutter_shop/provide/sort_top_provide.dart';
import 'package:flutter_shop/provide/status_top_provide.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/routers/base_router.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import '../model/category_top.dart';
import '../base/api/api_url.dart';
import '../model/category_bottom.dart';
import '../provide/category_bottom_list_provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
 * 分类
 */
class CatergoryPage extends StatelessWidget {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    try {
      if (Provide.value<CategoryBottomProvide>(context).page == 1) {
        scrollController.jumpTo(0.0);
      }
    } catch (e) {
      print("页面第一次初始化${e}");
    }
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(1920),
      child: Stack(
        children: <Widget>[
          Positioned(child: CategoryTopTextField(),top: 20,),
          Positioned(child: Container(
              width: ScreenUtil().setWidth(1080),
              height: ScreenUtil().setHeight(1600),
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: EasyRefresh(
                    child: ListView(
                      controller: scrollController,
                      children: <Widget>[
                        CategoryTopOne(),
                        CategoryTopTwo(),
                        CategoryTopThree(),
                        CategoryBottomList(),
                      ],
                    ),
                    header: ClassicalHeader(
                        showInfo: false,
                        refreshText: "下拉刷新...",
                        refreshingText: "正在刷新...",
                        refreshFailedText: "加载完成"),
                    footer: ClassicalFooter(
                        showInfo: false,
                        loadedText: "正在加载...",
                        loadReadyText: "正在加载...",
                        loadingText: "正在加载...",
                        noMoreText: Provide.value<CategoryBottomProvide>(context)
                            .setNoMoreText("没有更多数据了")),
                    onLoad: () async {
                      Provide.value<CategoryBottomProvide>(context).addPage();
                      getCategoryBottom(context, false);
                    },
                    onRefresh: () async {
                      Provide.value<CategoryBottomProvide>(context).setPage(1);
                      getCategoryBottom(context, true);
                    },
                  ))
          ),top: 70),
        ],
      ),
    );
  }
}
