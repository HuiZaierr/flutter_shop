import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/r.dart';

/*
 * 顶部图片
 */
class MineTopImgArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        R.assetsImgMineTopBg,
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(480),
        fit: BoxFit.fill,
      ),
    );
  }
}
