import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/login_provide.dart';
import 'package:flutter_shop/r.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';

class LoginTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(575),
      child: Stack(
        children: <Widget>[
          Positioned(child: ImageTop(), top: 0),
          Positioned(child: ImageBack(context), top: 30),
          ImageCenter(),
        ],
      ),
    );
  }
}

ImageTop() {
  return Image.asset(
    R.assetsImgLoginByPhoneTopImg,
    width: ScreenUtil().setWidth(1080),
    height: ScreenUtil().setHeight(570),
    fit: BoxFit.fill,
  );
}

ImageBack(BuildContext context) {
  return InkWell(
      onTap: () {
        Provide.value<LoginProvide>(context).setPhone("");
        Provide.value<LoginProvide>(context).setCode("");
        Provide.value<LoginProvide>(context).setSecondNum(0);
        Navigator.pop(context);
      },
      child: Container(
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setHeight(100),
        alignment: Alignment.center,
        child: Image.asset(
          R.assetsImgIcBackPersonal,
          width: ScreenUtil().setWidth(45),
          height: ScreenUtil().setHeight(70),
        ),
      ));
}

ImageCenter() {
  return Container(
    alignment: Alignment.center,
    child: Image.asset(
      R.assetsImgLoginTopLogo,
      width: ScreenUtil().setWidth(470),
      height: ScreenUtil().setHeight(210),
    ),
  );
}
