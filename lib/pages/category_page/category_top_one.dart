import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/provide/category_bottom_list_provide.dart';
import 'package:flutter_shop/provide/category_top_provide.dart';
import 'package:provide/provide.dart';

class CategoryTopOne extends StatelessWidget {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return Provide<CategoryProvide>(builder: (context, child, data) {
      return Container(
        width: ScreenUtil().setWidth(1080),
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(20)),
        decoration: BoxDecoration(
            border:
            Border(bottom: BorderSide(width: ScreenUtil().setHeight(0.5), color: Colors.black26))),
        child: Wrap(
            spacing:7,
            children: widgetList(data.categoryList, isClick),
        ),
      );
    });
  }
}

widgetList(List newList,bool isClick){
  if (newList.length > 0) {
    List<Widget> widgetList = [];
    for (var i = 0; i < newList.length; i++) {
      isClick = Provide.value<CategoryProvide>(Application.context).id == newList[i].id ? true : false;
      widgetList.add(ItemView(newList, i,isClick));
    }
    return widgetList;
  }
}

ItemView(List newList,int index,bool isClick) {
    return Container(
        width: ScreenUtil().setWidth(127),
        height: ScreenUtil().setHeight(110),
        child: InkWell(
            onTap: () {
              Provide.value<CategoryProvide>(Application.context)
                  .setCategoryId(newList[index].id);
              Provide.value<CategoryBottomProvide>(Application.context).setPage(1);
              getCategoryBottom(Application.context, true);
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Title(newList, index, isClick),
                  BottomIndicator(isClick),
                ],
              ),
            )),
    );
}

Title(List newList,int index,bool isClick){
  return Text(
    newList[index].value,
    style: TextStyle(
        color: isClick ? Colors.orange : Colors.black,fontSize: ScreenUtil().setSp(40)),
  );
}

BottomIndicator(bool isClick){
  return Container(
    margin: EdgeInsets.only(top: ScreenUtil().setHeight(3)),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Container(
          alignment: Alignment.topCenter,
          color: isClick ? Colors.orange : Colors.white,
          width: ScreenUtil().setWidth(60),
          height: ScreenUtil().setHeight(6),
        ))
  );
}