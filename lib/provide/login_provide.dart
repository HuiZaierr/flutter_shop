import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/category_bottom.dart';

class LoginProvide with ChangeNotifier {
  //验证码
  String phone = "";
  String code = "";
  String msg = "";
  int secondNum = 0;

  //登录信息
  bool isLogin = false;
  int userId = -1;
  String mobile = "";
  String nickname = "";
  String avatar = "";
  int gender = -1;
  String birthday = "";
  String briefIntroduction = "";
  String userSign = "";
  String token = "";
  int firstLogin = -1;
  int newUser = -1;
  String newUserMsg = "";
  int rewardIntegral = -1;

  setSecondNum(int secondNum) {
    this.secondNum = secondNum;
    notifyListeners();
  }

  setPhone(String phone) {
    this.phone = phone;
    notifyListeners();
  }

  setCode(String code) {
    this.code = code;
    notifyListeners();
  }

  setMsg(String msg) {
    this.msg = msg;
    notifyListeners();
  }

  setUserInfo(
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
      rewardIntegral) {
    this.isLogin = true;
    this.userId = userId;
    this.mobile = nickname;
    this.nickname = nickname;
    this.avatar = avatar;
    this.gender = gender;
    this.birthday = birthday;
    this.briefIntroduction = briefIntroduction;
    this.userSign = userSign;
    this.token = token;
    this.firstLogin = firstLogin;
    this.newUser = newUser;
    this.newUserMsg = newUserMsg;
    this.rewardIntegral = rewardIntegral;
    notifyListeners();
  }

  cleanUserInfo() {
    this.isLogin = false;
    this.userId = -1;
    this.mobile = "";
    this.nickname = "";
    this.avatar = "";
    this.gender = -1;
    this.birthday = "";
    this.briefIntroduction = "";
    this.userSign = "";
    this.token = "";
    this.firstLogin = -1;
    this.newUser = -1;
    this.newUserMsg = "";
    this.rewardIntegral = -1;
    notifyListeners();
  }
}
