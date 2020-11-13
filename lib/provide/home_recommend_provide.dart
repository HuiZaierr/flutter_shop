import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/config/constans.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:provide/provide.dart';
import '../model/home_recommend.dart';
import '../base/api/httpheader.dart';
import 'dart:convert';

class HomeRecommendProvide with ChangeNotifier {
  bool isHideTop = false;   //是否隐藏顶部Tab

  HomeRecommendData homeRecommendData = null;
  List<BannerData> bannerList = [];
  List<ModulesData> modulesList = [];
  /*
  * 设置首页数据
  */
  setHomeRecommendData() async {
    await request('rhomepage', true).then((value) {
      print("当前获取到的值为：${value.toString()}");
      var response = json.decode(value.toString());
      HomeRecommendBean bean = HomeRecommendBean.fromJson(response);
      this.homeRecommendData = bean.data;
      this.bannerList = bean.data.banner;
      this.modulesList = bean.data.modules;
      notifyListeners();
    });
  }

  changeHideTop(bool isHideTop){
    this.isHideTop = isHideTop;
    notifyListeners();
  }
}
