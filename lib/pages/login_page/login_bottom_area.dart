import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/config/constans.dart';
import 'package:flutter_shop/provide/login_provide.dart';
import 'package:flutter_shop/r.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/ui/login_page.dart';
import 'package:flutter_shop/utils/regular_utils.dart';
import 'package:flutter_shop/utils/toast_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginBottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //手机号
    TextEditingController _phoneController = TextEditingController.fromValue(
        TextEditingValue(
            // 设置内容
            text: Provide.value<LoginProvide>(context).phone,
            // 保持光标在最后
            selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: Provide.value<LoginProvide>(context).phone.length))));
    //验证码
    TextEditingController _codeController = TextEditingController.fromValue(
        TextEditingValue(
            // 设置内容
            text: Provide.value<LoginProvide>(context).code,
            // 保持光标在最后
            selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: Provide.value<LoginProvide>(context).code.length))));

    return Container(
      width: ScreenUtil().setWidth(1080),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
      child: Column(
        children: <Widget>[
          Phone(context, _phoneController),
          Code(context, _codeController),
          BottomBTN(context),
          ProtocolText()
        ],
      ),
    );
  }
}

Phone(BuildContext context, TextEditingController _phoneController) {
  return Container(
    height: ScreenUtil().setHeight(130),
    margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(120), right: ScreenUtil().setWidth(80)),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
    child: Row(
      children: <Widget>[
        PhoneImage(),
        PhoneTextField(context, _phoneController),
        PhoneCleanImage(context, _phoneController)
      ],
    ),
  );
}

PhoneImage() {
  return Container(
    margin: EdgeInsets.only(right: ScreenUtil().setWidth(50)),
    child: Image.asset(
      R.assetsImgIcMobileFlag,
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(100),
    ),
  );
}

PhoneTextField(BuildContext context, TextEditingController _phoneController) {
  return Container(
    width: ScreenUtil().setWidth(640),
    height: ScreenUtil().setHeight(120),
    child: TextField(
      autofocus: false,
      controller: _phoneController,
      maxLength: 11,
      keyboardType: TextInputType.number, //输入类型数字
      //输入文本的样式
      style: TextStyle(fontSize: ScreenUtil().setSp(45), color: Colors.black87),
      cursorColor: Colors.orange,
      decoration: InputDecoration(
          hintText: "请输入手机号",
          hintStyle:
              TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(45)),
          border: OutlineInputBorder(
              gapPadding: 0.0,
              borderSide: BorderSide(color: Colors.transparent)),
          contentPadding: EdgeInsets.all(0.0),
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          counterText: ""),
      onChanged: (value) {
        //文本改变
        Provide.value<LoginProvide>(context).setPhone(value);
      },
    ),
  );
}

//删除图标
PhoneCleanImage(BuildContext context, TextEditingController _phoneController) {
  return Provide<LoginProvide>(builder: (context, child, data) {
    if (data.phone.length <= 0) {
      return Container();
    } else {
      return InkWell(
          onTap: () {
            _phoneController.text = "";
            Provide.value<LoginProvide>(context).setPhone("");
          },
          child: Container(
            width: ScreenUtil().setWidth(120),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.center,
            child: Image.asset(
              R.assetsImgIcClear,
              width: ScreenUtil().setWidth(45),
              height: ScreenUtil().setHeight(45),
            ),
          ));
    }
  });
}

//验证码
Code(BuildContext context, TextEditingController _codeController) {
  return Container(
    height: ScreenUtil().setHeight(130),
    margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(120), right: ScreenUtil().setWidth(80)),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
    child: Row(
      children: <Widget>[
        CodeImage(),
        CodeTextField(context, _codeController),
        getCodeBtn(context)
      ],
    ),
  );
}

CodeImage() {
  return Container(
    margin: EdgeInsets.only(right: ScreenUtil().setWidth(50)),
    child: Image.asset(
      R.assetsImgIcPasswordFlag,
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(100),
    ),
  );
}

CodeTextField(BuildContext context, TextEditingController _codeController) {
  return Container(
    width: ScreenUtil().setWidth(470),
    height: ScreenUtil().setHeight(120),
    child: TextField(
      autofocus: false,
      controller: _codeController,
      maxLength: 6,
      keyboardType: TextInputType.number, //输入类型数字
      //输入文本的样式
      style: TextStyle(fontSize: ScreenUtil().setSp(45), color: Colors.black87),
      cursorColor: Colors.orange,
      decoration: InputDecoration(
          hintText: "请输入验证码",
          hintStyle:
              TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(45)),
          border: OutlineInputBorder(
              gapPadding: 0.0,
              borderSide: BorderSide(color: Colors.transparent)),
          contentPadding: EdgeInsets.all(0.0),
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          counterText: ""),
      onChanged: (value) {
        //文本改变
        Provide.value<LoginProvide>(context).setCode(value);
      },
    ),
  );
}

//获取验证码
getCodeBtn(BuildContext context) {
  return Provide<LoginProvide>(
    builder: (context, child, value) {
      return InkWell(
        onTap: () {
          if (value.phone.length == 11 &&
              RegularUtils.isChinaPhoneLegal(value.phone)) {
            Provide.value<LoginProvide>(context).setSecondNum(60);
            //开始倒计时
            startCountdownTimer();
            getCode();
          } else if (value.phone.length == 0) {
            ToastUtils.show("请输入手机号");
          } else {
            ToastUtils.show("请输入正确的手机号");
          }
        },
        child: Container(
          width: ScreenUtil().setWidth(290),
          height: ScreenUtil().setHeight(75),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: value.secondNum == 0
                  ? Color.fromRGBO(255, 234, 220, 1)
                  : Color.fromRGBO(238, 238, 238, 1)),
          child: Text(
            value.secondNum == 0 ? "获取验证码" : "剩余 ${value.secondNum} 秒",
            style: TextStyle(
                color: value.secondNum == 0
                    ? Color.fromRGBO(252, 126, 42, 1)
                    : Colors.black87),
          ),
        ),
      );
    },
  );
}

//倒计时
void startCountdownTimer() {
  Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (Provide.value<LoginProvide>(Application.context).secondNum == 0) {
      timer.cancel();
    } else {
      int secondNum =
          Provide.value<LoginProvide>(Application.context).secondNum;
      Provide.value<LoginProvide>(Application.context)
          .setSecondNum(--secondNum);
    }
  });
}

//登录按钮
BottomBTN(BuildContext context) {
  return Provide<LoginProvide>(
    builder: (context, child, data) {
      if (data.code.length >= 6) {
        return Container(
          height: ScreenUtil().setHeight(100),
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(200)),
          child: InkWell(
            onTap: () {
              login(context);
            },
            child: Container(
              width: ScreenUtil().setWidth(700),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(252, 126, 42, 1)),
              child: Text(
                "登录",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(55),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
      } else {
        return Container(
          height: ScreenUtil().setHeight(100),
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(200)),
          child: InkWell(
            child: Container(
              width: ScreenUtil().setWidth(700),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(204, 204, 204, 1)),
              child: Text(
                "登录",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(55),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
      }
    },
  );
}

//协议
ProtocolText() {
  return Container(
    margin: EdgeInsets.only(top: 10, left: ScreenUtil().setWidth(190)),
    width: ScreenUtil().setWidth(1080),
    child: Row(children: <Widget>[
      Container(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "登录及表示为同意",
                  style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 1),
                      fontSize: ScreenUtil().setSp(35))),
              TextSpan(
                  text: "《隐私策略》",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      _launchURL(Constans.PRIVACY_POLICY);
                    },
                  style: TextStyle(
                      color: Color.fromRGBO(252, 126, 42, 1),
                      fontSize: ScreenUtil().setSp(35))),
              TextSpan(
                  text: "和",
                  style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 1),
                      fontSize: ScreenUtil().setSp(35))),
              TextSpan(
                  text: "《服务条款》",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      _launchURL(Constans.SERVE_CONDITION);
                    },
                  style: TextStyle(
                      color: Color.fromRGBO(252, 126, 42, 1),
                      fontSize: ScreenUtil().setSp(35))),
            ]),
          )),
    ]),
  );
}

_launchURL(String urls) async {
  String url = urls;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
