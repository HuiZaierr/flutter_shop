import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/constans.dart';
import 'package:flutter_shop/model/login.dart';
import 'package:flutter_shop/pages/login_page/login_bottom_area.dart';
import 'package:flutter_shop/pages/login_page/login_top_area.dart';
import 'package:flutter_shop/provide/login_provide.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/utils/toast_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';

/*
 * 登录页面
 */
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView(
          children: <Widget>[
            LoginTopArea(), //顶部
            LoginBottomArea(),
          ],
        ),
      )),
    );
  }
}
