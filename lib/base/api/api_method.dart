import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/config/constans.dart';
import 'package:flutter_shop/model/category_bottom.dart';
import 'package:flutter_shop/model/category_top.dart';
import 'package:flutter_shop/model/collect_list.dart';
import 'package:flutter_shop/model/history_list.dart';
import 'package:flutter_shop/model/integral_detail.dart';
import 'package:flutter_shop/model/login.dart';
import 'package:flutter_shop/model/mine_userreadinfo.dart';
import 'package:flutter_shop/provide/category_bottom_list_provide.dart';
import 'package:flutter_shop/provide/category_top_provide.dart';
import 'package:flutter_shop/provide/collect_list_provide.dart';
import 'package:flutter_shop/provide/history_list_provide.dart';
import 'package:flutter_shop/provide/home_recommend_provide.dart';
import 'package:flutter_shop/provide/integral_detail_provide.dart';
import 'package:flutter_shop/provide/login_provide.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/provide/mine_userreadinfo_provide.dart';
import 'package:flutter_shop/provide/sort_top_provide.dart';
import 'package:flutter_shop/provide/status_top_provide.dart';
import 'package:flutter_shop/utils/provide_utils.dart';
import 'package:flutter_shop/utils/sp_utils.dart';
import 'package:flutter_shop/utils/toast_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_url.dart';
import 'dart:io';
import 'dart:async';
import 'httpheader.dart';

/*
 * 公共的请求方法 
 */
Future request(url, isGet, {formdata}) async {
  try {
    print("开始请求数据.................");
    Response response;
    Dio dio = Dio();
    dio.options.headers =
        Provide.value<LoginProvide>(Application.context).isLogin
            ? header
            : noLoginheader;
    //判断formdata是否有值
    if (formdata == null) {
      //无参数的
      if (isGet) {
        response = await dio.get(servicePath[url]);
      } else {
        dio.options.contentType =
            ContentType.parse("application/x-www-form-urlencoded").toString();
        response = await dio.post(servicePath[url]);
      }
    } else {
      if (isGet) {
        response = await dio.get(servicePath[url], queryParameters: formdata);
      } else {
        dio.options.contentType =
            ContentType.parse("application/x-www-form-urlencoded").toString();
        response = await dio.post(servicePath[url], data: formdata);
      }
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端抛出异常');
    }
  } catch (e) {
    print("Error:==============${e}");
  }
}

//获取首页数据
Future getHomeRecommendData() async {
  await Provide.value<HomeRecommendProvide>(Application.context)
      .setHomeRecommendData();
  return "完成加载";
}

/*
 * 获取分类
 */
 getCategoryTop() async {
  await request('allCategory', true).then((value) {
    var data = json.decode(value.toString());
    CategortTopBean bean = CategortTopBean.fromJson(data);
    //使用状态管理Prvide管理
    Provide.value<CategoryProvide>(Application.context)
        .setCategoryList(bean.data.category, bean.data.category[0].id);
    Provide.value<StatusProvide>(Application.context)
        .setStatusList(bean.data.status, bean.data.status[0].id);
    Provide.value<SortProvide>(Application.context)
        .setSortList(bean.data.sort, bean.data.sort[1].id);
    getCategoryBottom(Application.context, true);
  });
}

 /*
  * //获取分类底部数据
  */
getCategoryBottom(BuildContext context, bool isRefresh) async {
  var data = {
    'page': Provide.value<CategoryBottomProvide>(context).page,
    'cate': Provide.value<CategoryProvide>(context).id,
    'rate': Provide.value<StatusProvide>(context).id,
    'sort': Provide.value<SortProvide>(context).id,
    'requestid': Constans.REQUESTID
  };

  await request('cateDetail', true, formdata: data).then((value) {
    var data = json.decode(value.toString());
    CategoryBottomBean bean = CategoryBottomBean.fromJson(data);
    if (bean.data.list.length > 0) {
      for (var i = 0; i < bean.data.list.length; i++) {
        if (bean.data.list[i].coverImg == null) {
          bean.data.list.removeAt(i);
        }
      }
      if (isRefresh) {
        //状态管理
        Provide.value<CategoryBottomProvide>(context)
            .setCategoryBottomList(bean.data.list);
      } else {
        Provide.value<CategoryBottomProvide>(context)
            .addCategoryBottomList(bean.data.list);
      }
    } else {
      print("没有更多数据了........");
      Fluttertoast.showToast(
        msg: "没有更多数据了",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  });
}


/*
 * 获取我的页面积分情况
 */
getIntegralTopData() async {
  if (ProvideUtils.isLogin()) {
    var formdata = {Constans.REQUESTID: Constans.REQUESTID_VALUE};
    await request("userIntegral", false, formdata: formdata).then((value) {
      // print("获取当前getIntegralTopData的数据值为：${value.toString()}");
      var data = json.decode(value.toString());
      IntegralDetailBean bean = IntegralDetailBean.fromJson(data);
      Provide.value<IntegralDetailProvide>(Application.context)
          .setIntegralDetail(bean.data.integralTotal, bean.data.receiveIntegral,
              bean.data.useIntegral, bean.data.mayRead, bean.data.isSign);
    });
  }
}

/*
 * 获取我的页面用户阅读时长
 */
getUserReadInfo() async {
  if (ProvideUtils.isLogin()) {
    var formdata = {Constans.REQUESTID: Constans.REQUESTID_VALUE};
    await request("userReadInfo", true, formdata: formdata).then((value) {
      var data = json.decode(value.toString());
      MineUserReadInfoBean bean = MineUserReadInfoBean.fromJson(data);
      Provide.value<MineUserReadInfoProvide>(Application.context)
          .setUserReadInfo(bean.data.readTime, bean.data.readOff,
              bean.data.haveRead, bean.data.commentNum, bean.data.exceedNum);
    });
  }
}

/*
 * 获取收藏列表
 */
getCollectInfo(bool isRefresh) async {
    print("获取收藏列表数据...............");
    var formdata = {
      Constans.PAGE: Provide.value<CollectListProvide>(Application.context).page,
      Constans.REQUESTID: Constans.REQUESTID_VALUE
    };
    await request("rfavorites", false, formdata: formdata).then((value) {
      var data = json.decode(value.toString());
      print(value.toString());
      CollectListBean bean = CollectListBean.fromJson(data);
      if (bean.data.collectList.length > 0) {
        for (var i = 0; i < bean.data.collectList.length; i++) {
          if (bean.data.collectList[i].coverImg == null) {
            bean.data.collectList.removeAt(i);
          }
        }
        if (isRefresh) {
          //状态管理
          Provide.value<CollectListProvide>(Application.context)
              .setCollectListData(bean.type,bean.data.collectList,bean.data.totalpage);
        } else {
          Provide.value<CollectListProvide>(Application.context).addCollectListData(bean.data.collectList);
        }
      } else {
        print("没有更多数据了........");
        Fluttertoast.showToast(
          msg: "没有更多数据了",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    });
  }

/*
 * 获取历史列表
 */
getHistoryInfo(bool isRefresh) async {
  print("获取历史列表数据...............");
  var formdata = {
    Constans.PAGE: Provide.value<HistoryListProvide>(Application.context).page,
    Constans.REQUESTID: Constans.REQUESTID_VALUE
  };
  await request("rhistory", false, formdata: formdata).then((value) {
    var data = json.decode(value.toString());
    print(value.toString());
    HistoryListBean bean = HistoryListBean.fromJson(data);
    if (bean.data.historyList.length > 0) {
      for (var i = 0; i < bean.data.historyList.length; i++) {
        if (bean.data.historyList[i].coverImg == null) {
          bean.data.historyList.removeAt(i);
        }
      }
      if (isRefresh) {
        //状态管理
        Provide.value<HistoryListProvide>(Application.context)
            .setCollectListData(bean.type,bean.data.historyList,bean.data.totalpage);
      } else {
        Provide.value<HistoryListProvide>(Application.context).addCollectListData(bean.data.historyList);
      }
    } else {
      print("没有更多数据了........");
      Fluttertoast.showToast(
        msg: "没有更多数据了",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  });
}


//获取验证码
getCode() async {
  var data = {
    "phone": Provide.value<LoginProvide>(Application.context).phone,
    Constans.REQUESTID: Constans.REQUESTID_VALUE
  };
  await request("captcha", false, formdata: data).then((value) {
    ToastUtils.show("发送成功");
  });
}

login(BuildContext context) async {
  var data = {
    "phone": Provide.value<LoginProvide>(Application.context).phone,
    "code": Provide.value<LoginProvide>(Application.context).code,
    'requestid': Constans.REQUESTID,
    'refer': Constans.LOGIN_MY_AVATAR,
    'type': "login",
  };
  await request("login", false, formdata: data).then((value) {
    Provide.value<LoginProvide>(context).setPhone("");
    Provide.value<LoginProvide>(context).setCode("");
    Provide.value<LoginProvide>(context).setSecondNum(0);
    // print("获取当前的数据值为：${value.toString()}");
    ToastUtils.show("登录成功");
    var data = json.decode(value.toString());
    LoginBean bean = LoginBean.fromJson(data);
    SPUtils.setLoginInfo(bean); //使用sp保存登录信息
    Provide.value<LoginProvide>(context).setUserInfo(
        bean.data.userId,
        bean.data.mobile,
        bean.data.nickname,
        bean.data.avatar,
        bean.data.gender,
        bean.data.birthday,
        bean.data.briefIntroduction,
        bean.data.userSign,
        bean.data.token,
        bean.data.firstLogin,
        bean.data.newUser,
        bean.data.newUserMsg,
        bean.data.rewardIntegral);
    Navigator.pop(context);
    getUserReadInfo();
    getIntegralTopData();
    getHomeRecommendData();
    getHistoryInfo(true);
    getCollectInfo(true);
  });
}
