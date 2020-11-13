import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/integral_detail_provide.dart';
import 'package:flutter_shop/provide/login_provide.dart';
import 'package:flutter_shop/r.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/routers/base_router.dart';
import 'package:flutter_shop/utils/provide_utils.dart';
import 'package:flutter_shop/utils/toast_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import '../../config/constans.dart';

class MineInfoArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(40),
          right: ScreenUtil().setWidth(40),
          bottom: ScreenUtil().setWidth(40)),
      width: ScreenUtil().setWidth(1000),
      height: ScreenUtil().setHeight(320),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[UserPhoto(context), UserInfo(context)],
      ),
    );
  }
}

//用户头像
UserPhoto(BuildContext context) {
  return Provide<LoginProvide>(
    builder: (context, child, value) {
      return InkWell(
        onTap: () {
          if (value.isLogin) {
            ToastUtils.show("您已登录");
          } else {
            Application.router.navigateTo(context, Constans.login);
          }
        },
        child: Container(
          margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(50),
              right: ScreenUtil().setWidth(60)),
          alignment: Alignment.centerLeft,
          child: ClipOval(
            child: value.isLogin
                ? value.avatar.isEmpty
                    ? Image.asset(
                        R.assetsImgPersonalHeadLogin,
                        height: ScreenUtil().setHeight(190),
                        width: ScreenUtil().setWidth(230),
                        fit: BoxFit.fill,
                      )
                    : Image.network(
                        value.avatar,
                        height: ScreenUtil().setHeight(190),
                        width: ScreenUtil().setWidth(230),
                      )
                : Image.asset(
                    R.assetsImgPersonalHeadLogin,
                    height: ScreenUtil().setHeight(190),
                    width: ScreenUtil().setWidth(230),
                    fit: BoxFit.fill,
                  ),
          ),
        ),
      );
    },
  );
}

//用户信息
UserInfo(BuildContext context) {
  return Container(
    child: Column(
      children: <Widget>[
        UserTopInfo(context),
        UserBottomInfo(),
      ],
    ),
  );
}

//顶部数据
UserTopInfo(BuildContext context) {
  return Provide<LoginProvide>(builder: (context, child, value) {
    return InkWell(
      onTap: () {
        if (value.isLogin) {
          ToastUtils.show("您已登录");
        } else {
          Application.router.navigateTo(context, Constans.login);
        }
      },
      child: Container(
        width: ScreenUtil().setWidth(660),
        height: ScreenUtil().setHeight(160),
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.black26))),
        child: Row(
          children: <Widget>[
            Container(
                width: ScreenUtil().setWidth(550),
                child: Text(
                  value.isLogin
                      ? value.nickname.isEmpty ? value.mobile : value.nickname
                      : "立即登录",
                  style: TextStyle(
                      color: value.isLogin
                          ? Color.fromRGBO(51, 51, 51, 1)
                          : Color.fromRGBO(252, 126, 42, 1),
                      fontSize: ScreenUtil().setSp(52),
                      fontWeight: FontWeight.bold),
                )),
            Container(
              width: ScreenUtil().setWidth(110),
              padding: EdgeInsets.only(right: ScreenUtil().setWidth(60)),
              alignment: Alignment.centerRight,
              child: Image.asset(
                R.assetsImgToAnyWhere,
                width: ScreenUtil().setWidth(27),
                height: ScreenUtil().setHeight(27),
              ),
            )
          ],
        ),
      ),
    );
  });
}

//底部数据
UserBottomInfo() {
  return Provide<IntegralDetailProvide>(
    builder: (context, child, value) {
      return Container(
        width: ScreenUtil().setWidth(660),
        height: ScreenUtil().setHeight(160),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(5)),
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
              child: Image.asset(
                R.assetsImgChangdu,
                width: ScreenUtil().setWidth(40),
                height: ScreenUtil().setHeight(40),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(60)),
                child: Text(
                  ProvideUtils.isLogin() ? "畅读${value.mayRead}话" : "畅读0话",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(45), color: Colors.orange),
                )),
            Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(5)),
              child: Image.asset(
                R.assetsImgIvIntegral,
                width: ScreenUtil().setWidth(43),
                height: ScreenUtil().setHeight(43),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: ScreenUtil().setWidth(5)),
                child: Text(
                  ProvideUtils.isLogin() ? "${value.integralTotal}积分" : "0积分",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(45),
                      color: Color.fromRGBO(102, 102, 102, 1)),
                )),
          ],
        ),
      );
    },
  );
}
