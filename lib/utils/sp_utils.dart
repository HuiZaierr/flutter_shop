import 'dart:math';

import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/config/constans.dart';
import 'package:flutter_shop/model/login.dart';
import 'package:flutter_shop/provide/login_provide.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  static SharedPreferences sp;

  static setLoginInfo(LoginBean bean) async {
    sp = await SharedPreferences.getInstance();
    await sp.setInt(Constans.USER_Id, bean.data.userId);
    await sp.setString(Constans.MOBILE, bean.data.mobile);
    await sp.setString(Constans.NICKNAME, bean.data.nickname);
    await sp.setString(Constans.AVATAR, bean.data.avatar);
    await sp.setInt(Constans.GENDER, bean.data.gender);
    await sp.setString(Constans.BIRTHDAY, bean.data.birthday);
    await sp.setString(
        Constans.BRIEF_INTRODUCTION, bean.data.briefIntroduction);
    await sp.setString(Constans.USERSIGN, bean.data.userSign);
    await sp.setString(Constans.TOKENS, bean.data.token);
    await sp.setInt(Constans.FIRSTLOGIN, bean.data.firstLogin);
    await sp.setInt(Constans.NEWUSER, bean.data.newUser);
    await sp.setString(Constans.NEWUSERMSG, bean.data.newUserMsg);
    await sp.setInt(Constans.REWARDINTEGRAL, bean.data.rewardIntegral);
  }

  static getLoginInfo() async {
    sp = await SharedPreferences.getInstance();
    int userId = sp.getInt(Constans.USER_Id);
    print("当前的USERID值为：${userId}");
    if (userId != null) {
      String mobile = sp.getString(Constans.MOBILE);
      String nickname = sp.getString(Constans.NICKNAME);
      String avatar = sp.getString(Constans.AVATAR);
      int gender = sp.getInt(Constans.GENDER);
      String birthday = sp.getString(Constans.BIRTHDAY);
      String briefIntroduction = sp.getString(Constans.BRIEF_INTRODUCTION);
      String userSign = sp.getString(Constans.USERSIGN);
      String token = sp.getString(Constans.TOKENS);
      int firstLogin = sp.getInt(Constans.FIRSTLOGIN);
      int newUser = sp.getInt(Constans.NEWUSER);
      String newUserMsg = sp.getString(Constans.NEWUSERMSG);
      int rewardIntegral = sp.getInt(Constans.REWARDINTEGRAL);
      Provide.value<LoginProvide>(Application.context).setUserInfo(
          userId,
          mobile,
          nickname,
          avatar,
          gender,
          birthday,
          briefIntroduction,
          userSign,
          token,
          firstLogin,
          newUser,
          newUserMsg,
          rewardIntegral);
      getUserReadInfo();
      getIntegralTopData();
      getHomeRecommendData();
      getCategoryTop();       //分类数据
      getHistoryInfo(true);
      getCollectInfo(true);
    }else{
      getHomeRecommendData(); //首页数据
      getCategoryTop();       //分类数据
      getHistoryInfo(true);   //历史
    }
  }
}
