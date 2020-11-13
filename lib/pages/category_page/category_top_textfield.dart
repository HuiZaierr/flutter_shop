import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/r.dart';
import 'package:flutter_shop/utils/toast_utils.dart';

class CategoryTopTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          ToastUtils.show("搜索");
        },
        child: Container(
          height: ScreenUtil().setHeight(75),
          width: ScreenUtil().setWidth(940),
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
              left: 20, right: 20, top: ScreenUtil().setHeight(35)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(238, 238, 238, 1)),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 90, right: 5),
                padding: EdgeInsets.only(top: 3),
                child: Image.asset(R.assetsImgHomeSearchGray),
                width: ScreenUtil().setWidth(45),
                height: ScreenUtil().setHeight(45),
              ),
              Text(
                "搜索作品名/作者名",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(45),
                    color: Color.fromRGBO(158, 158, 158, 1)),
              )
            ],
          ),
        ));
  }
}
