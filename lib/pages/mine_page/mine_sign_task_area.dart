import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/r.dart';
import 'package:flutter_shop/utils/toast_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
 * 我的-------签到/任务中心
 */
class MineSignTaskArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(170),
      color: Colors.white,
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
      child: Row(
        children: <Widget>[
          sign(),
          line(),
          taskCenter(),
        ],
      ),
    );
  }
}

//签到
sign() {
  return Container(
      width: ScreenUtil().setWidth(539),
      alignment: Alignment.topCenter,
      child: InkWell(
        onTap: () {
          ToastUtils.show("签到");
        },
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(30),
                  bottom: ScreenUtil().setHeight(5)),
              child: Image.asset(
                R.assetsImgIvSignIn,
                width: ScreenUtil().setWidth(70),
                height: ScreenUtil().setWidth(70),
              ),
            ),
            Text(
              "签到",
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ));
}

line() {
  return Container(
    width: 1,
    margin: EdgeInsets.only(top: 5, bottom: 5),
    color: Colors.black12,
  );
}

//任务中心
taskCenter() {
  return Container(
      width: ScreenUtil().setWidth(538),
      alignment: Alignment.topCenter,
      child: InkWell(
        onTap: () {
          ToastUtils.show("任务中心");
        },
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(32),
                  bottom: ScreenUtil().setHeight(5)),
              child: Image.asset(
                R.assetsImgIvTaskCenter,
                width: ScreenUtil().setWidth(70),
                height: ScreenUtil().setWidth(70),
              ),
            ),
            Text(
              "任务中心",
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ));
}
