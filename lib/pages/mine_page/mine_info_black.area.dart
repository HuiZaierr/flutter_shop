import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/mine_userreadinfo_provide.dart';
import 'package:flutter_shop/r.dart';
import 'package:flutter_shop/utils/provide_utils.dart';
import 'package:provide/provide.dart';

/*
 * 我的-------黑色板块（阅读时长）
 */
class MineInfoBlackArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1000),
      height: ScreenUtil().setHeight(300),
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[Title(), BottomInfo()],
      ),
    );
  }
}

Title() {
  return Provide<MineUserReadInfoProvide>(builder: (context, child, value) {
    return Container(
      height: ScreenUtil().setHeight(100),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: Color.fromRGBO(255, 205, 85, 1),
      ),
      child: RichText(
        text: TextSpan(
            text: "超过了 ",
            style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1)),
            children: <TextSpan>[
              TextSpan(
                  text: ProvideUtils.isLogin() ? "${value.exceedNum}%" : "0%",
                  style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 1),
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: " 的漫画人",
                  style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1))),
            ]),
      ),
    );
  });
}

BottomInfo() {
  return Container(
    height: ScreenUtil().setHeight(200),
    margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
    child: Row(
      children: <Widget>[Left(), Right()],
    ),
  );
}

Left() {
  return Provide<MineUserReadInfoProvide>(
    builder: (context, child, value) {
      return Container(
        width: ScreenUtil().setWidth(380),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                ProvideUtils.isLogin() ? value.readTime : "0分",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(45), color: Colors.orange),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "阅读时长",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                    color: Color.fromRGBO(102, 102, 102, 1)),
              ),
            )
          ],
        ),
      );
    },
  );
}

Right() {
  return Container(
    width: ScreenUtil().setWidth(580),
    child: Row(
      children: <Widget>[readFinish(), haveRead(), recommend()],
    ),
  );
}

readFinish() {
  return Provide<MineUserReadInfoProvide>(builder: (context, child, value) {
    return Container(
      width: ScreenUtil().setWidth(190),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 20, bottom: 5),
            child: Text(
              ProvideUtils.isLogin() ? "${value.readOff}本" : "0本",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(45), color: Colors.orange),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "读完",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(40),
                  color: Color.fromRGBO(102, 102, 102, 1)),
            ),
          )
        ],
      ),
    );
  });
}

//读过
haveRead() {
  return Provide<MineUserReadInfoProvide>(builder: (context, child, value) {
    return Container(
      width: ScreenUtil().setWidth(190),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 20, bottom: 5),
            child: Text(
              ProvideUtils.isLogin() ? "${value.haveRead}本" : "0本",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(45), color: Colors.orange),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "读过",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(40),
                  color: Color.fromRGBO(102, 102, 102, 1)),
            ),
          )
        ],
      ),
    );
  });
}

//评论
recommend() {
  return Provide<MineUserReadInfoProvide>(builder: (context, child, value) {
    return Container(
      width: ScreenUtil().setWidth(190),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 20, bottom: 5),
            child: Text(
              ProvideUtils.isLogin() ? "${value.commentNum}条" : "0条",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(45), color: Colors.orange),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "评论",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(40),
                  color: Color.fromRGBO(102, 102, 102, 1)),
            ),
          )
        ],
      ),
    );
  });
}
