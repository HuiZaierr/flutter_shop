import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/r.dart';
import 'package:flutter_shop/utils/toast_utils.dart';

class HomeTopCornerArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(20),
      width: ScreenUtil().setWidth(1080),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft:Radius.circular(10))),
    );
  }
}

TopWhite(){
  return Container(
    width: ScreenUtil().setWidth(1080),
    height: ScreenUtil().setHeight(200),
    padding: EdgeInsets.only(bottom: 10),
    child: Row(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          child: Text("更新",style: TextStyle(fontSize: ScreenUtil().setSp(55),color: Colors.white),),
          margin: EdgeInsets.only(left: 15)
        ),
        Container(
            alignment: Alignment.bottomCenter,
            child: Text("推荐",style: TextStyle(fontSize: ScreenUtil().setSp(70),color: Colors.white),),
            margin: EdgeInsets.only(left: 15)
        ),
        Container(
            alignment: Alignment.bottomCenter,
            child: Text("榜单",style: TextStyle(fontSize: ScreenUtil().setSp(55),color: Colors.white),),
            margin: EdgeInsets.only(left: 15)
        ),
        InkWell(
          onTap: (){
            ToastUtils.show("搜索");
          },
          child: Container(
            width: ScreenUtil().setWidth(580),
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(left: 20,right: 15),
            child: Image.asset(R.assetsImgHomeSearchDark),
          ),
        )
      ],
    ),
  );
}

TopBlack(){
  return Container(
    width: ScreenUtil().setWidth(1080),
    height: ScreenUtil().setHeight(200),
    padding: EdgeInsets.only(bottom: 10),
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Container(
            alignment: Alignment.bottomCenter,
            child: Text("更新",style: TextStyle(fontSize: ScreenUtil().setSp(55),color: Colors.black),),
            margin: EdgeInsets.only(left: 15)
        ),
        Container(
            alignment: Alignment.bottomCenter,
            child: Text("推荐",style: TextStyle(fontSize: ScreenUtil().setSp(70),color: Colors.black),),
            margin: EdgeInsets.only(left: 15)
        ),
        Container(
            alignment: Alignment.bottomCenter,
            child: Text("榜单",style: TextStyle(fontSize: ScreenUtil().setSp(55),color: Colors.black),),
            margin: EdgeInsets.only(left: 15)
        ),
        InkWell(
          onTap: (){
            ToastUtils.show("搜索");
          },
          child: Container(
            width: ScreenUtil().setWidth(580),
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(left: 20,right: 15),
            child: Image.asset(R.assetsImgHomeSearchLight),
          ),
        )
      ],
    ),
  );
}