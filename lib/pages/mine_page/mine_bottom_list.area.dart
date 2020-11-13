import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/basesize.dart';
import 'package:flutter_shop/r.dart';
import 'package:flutter_shop/utils/toast_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
 * 我的-------底部列表
 */

class MineBottomListArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          BottomItem(
              Image.asset(
                R.assetsImgImgDownload,
                width: ScreenUtil().setHeight(BaseSize.size42),
                height: ScreenUtil().setHeight(BaseSize.size42),
              ),
              "离线下载",
              1),
          BottomItem(
              Image.asset(
                R.assetsImgImgMyMessage,
                width: ScreenUtil().setHeight(BaseSize.size42),
                height: ScreenUtil().setHeight(BaseSize.size42),
              ),
              "我的消息",
              2),
          BottomItem(
              Image.asset(
                R.assetsImgImgSuggest,
                width: ScreenUtil().setHeight(BaseSize.size42),
                height: ScreenUtil().setHeight(BaseSize.size42),
              ),
              "建议反馈",
              3),
          BottomItem(
              Image.asset(
                R.assetsImgImgRemark,
                width: ScreenUtil().setHeight(BaseSize.size42),
                height: ScreenUtil().setHeight(BaseSize.size42),
              ),
              "评分",
              4),
          BottomItem(
              Image.asset(
                R.assetsImgImgSetting,
                width: ScreenUtil().setHeight(BaseSize.size42),
                height: ScreenUtil().setHeight(BaseSize.size42),
              ),
              "设置",
              5),
          // BottomImage(),
        ],
      ),
    );
  }
}

BottomItem(Image icon, String title, int type) {
  return InkWell(
    onTap: () {
      switch (type) {
        case 1:
          ToastUtils.show("离线下载");
          break;
        case 2:
          ToastUtils.show("我的消息");
          break;
        case 3:
          ToastUtils.show("建议反馈");
          break;
        case 4:
          ToastUtils.show("评分");
          break;
        case 5:
          ToastUtils.show("设置");
          break;
      }
    },
    child: Container(
      height: ScreenUtil().setHeight(130),
      margin: EdgeInsets.only(top: 0.5, left: 15, right: 15),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 0.5,
        color: Color.fromRGBO(238, 238, 238, 1),
      ))),
      child: Row(
        children: <Widget>[
          icon,
          Container(
            width: ScreenUtil().setWidth(500),
            margin: EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(BaseSize.size44),
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: ScreenUtil().setWidth(408),
            child: Image.asset(
              R.assetsImgIcArrowRightPersonal,
              width: ScreenUtil().setHeight(24),
              height: ScreenUtil().setHeight(24),
            ),
          ),
        ],
      ),
    ),
  );
}

BottomImage() {
  return Container(
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().setWidth(1080),
      color: Color.fromRGBO(238, 238, 238, 1),
      child: Container(
        width: ScreenUtil().setWidth(700),
        child: Image.asset(
          R.assetsImgQqGroup,
          // width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(120),
        ),
      ));
}
