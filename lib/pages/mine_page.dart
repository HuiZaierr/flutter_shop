import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/mine_userreadinfo.dart';
import 'package:flutter_shop/pages/mine_page/mine_bottom_list.area.dart';
import 'package:flutter_shop/pages/mine_page/mine_info.area.dart';
import 'package:flutter_shop/pages/mine_page/mine_info_black.area.dart';
import 'package:flutter_shop/pages/mine_page/mine_sign_task_area.dart';
import 'package:flutter_shop/pages/mine_page/mine_top_img.area.dart';
import 'package:flutter_shop/provide/mine_userreadinfo_provide.dart';
import 'package:flutter_shop/r.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:provide/provide.dart';

/*
 * 我的
 */

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getUserReadInfo();
    getIntegralTopData();
    return Scaffold(
      body: Container(
          color: Color.fromRGBO(238, 238, 238, 1),
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(1080),
                  height: ScreenUtil().setHeight(625),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: MineTopImgArea(),
                        top: 0,
                      ),
                      Positioned(
                        child: MineInfoArea(),
                        top: ScreenUtil().setHeight(280),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    MineInfoBlackArea(),
                    MineSignTaskArea(),
                    MineBottomListArea()
                  ],
                )
              ],
            ),
          )),
    );
  }
}
