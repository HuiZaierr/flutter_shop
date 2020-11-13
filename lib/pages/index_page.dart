import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/pages/book_rack_page.dart';
import 'package:flutter_shop/pages/category_page.dart';
import 'package:flutter_shop/pages/home_page.dart';
import 'package:flutter_shop/pages/mine_page.dart';
import 'package:flutter_shop/provide/current_Index_provide.dart';
import 'package:flutter_shop/r.dart';
import 'package:provide/provide.dart';

class IndexPage extends StatelessWidget {
  int widthAndHeight = 70;

  //页面数据
  final List<Widget> tabBodies = [
    HomePage(),
    CatergoryPage(),
    BookRackPage(),
    MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 1080, height: 1920, allowFontScaling: true);
    return Provide<CurrentIndexProvide>(
      builder: (context, child, value) {
        int curIndex = value.currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 3.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: curIndex,
            items: _BottomNavigation(curIndex),
            selectedFontSize: ScreenUtil().setSp(35),
            unselectedFontSize: ScreenUtil().setSp(35),
            onTap: (index) {
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
              switch (value.currentIndex) {
                case 0:
                  break;
                case 1:
                  break;
                case 2:
                  break;
                case 3:
                  getIntegralTopData();
                  getUserReadInfo();
                  break;
              }
            },
          ),
          body: IndexedStack(index: curIndex, children: tabBodies),
        );
      },
    );
  }

  //底部导航栏数据
  _BottomNavigation(int currentIndex) {
    List<BottomNavigationBarItem> bottomTabs = [];
    bottomTabs
      ..add(BottomNavigationBarItem(
          icon: currentIndex == 0
              ? Image.asset(
                  R.assetsImgIcMaintab0White24dp,
                  width: ScreenUtil().setHeight(widthAndHeight),
                  height: ScreenUtil().setHeight(widthAndHeight),
                )
              : Image.asset(
                  R.assetsImgIcMaintab0White24dpNp,
                  width: ScreenUtil().setHeight(widthAndHeight),
                  height: ScreenUtil().setHeight(widthAndHeight),
                ),
          title: currentIndex == 0
              ? Text("发现",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(35), color: Colors.black87))
              : Text("发现",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(35),
                      color: Colors.black26))))
      ..add(BottomNavigationBarItem(
          icon: currentIndex == 1
              ? Image.asset(
                  R.assetsImgIcMaintab1White24dp,
                  width: ScreenUtil().setHeight(widthAndHeight),
                  height: ScreenUtil().setHeight(widthAndHeight),
                )
              : Image.asset(
                  R.assetsImgIcMaintab1White24dpNp,
                  width: ScreenUtil().setHeight(widthAndHeight),
                  height: ScreenUtil().setHeight(widthAndHeight),
                ),
          title: currentIndex == 1
              ? Text("分类",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(35), color: Colors.black87))
              : Text("分类",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(35),
                      color: Colors.black26))))
      ..add(BottomNavigationBarItem(
          icon: currentIndex == 2
              ? Image.asset(
                  R.assetsImgIcMaintab2White24dp,
                  width: ScreenUtil().setHeight(widthAndHeight),
                  height: ScreenUtil().setHeight(widthAndHeight),
                )
              : Image.asset(
                  R.assetsImgIcMaintab2White24dpNp,
                  width: ScreenUtil().setHeight(widthAndHeight),
                  height: ScreenUtil().setHeight(widthAndHeight),
                ),
          title: currentIndex == 2
              ? Text("书架",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(35), color: Colors.black87))
              : Text("书架",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(35),
                      color: Colors.black26))))
      ..add(BottomNavigationBarItem(
          icon: currentIndex == 3
              ? Image.asset(
                  R.assetsImgIcMaintab3White24dp,
                  width: ScreenUtil().setHeight(widthAndHeight),
                  height: ScreenUtil().setHeight(widthAndHeight),
                )
              : Image.asset(
                  R.assetsImgIcMaintab3White24dpNp,
                  width: ScreenUtil().setHeight(widthAndHeight),
                  height: ScreenUtil().setHeight(widthAndHeight),
                ),
          title: currentIndex == 3
              ? Text("我的",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(35), color: Colors.black87))
              : Text("我的",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(35),
                      color: Colors.black26))));
    return bottomTabs;
  }
}
