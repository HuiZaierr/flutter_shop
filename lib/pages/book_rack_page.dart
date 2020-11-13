import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/bookrack_page/bookrack_bottom_list_area.dart';
import 'package:flutter_shop/pages/bookrack_page/bookrack_top_tab_area.dart';
import 'package:flutter_shop/provide/book_current_provide.dart';
import 'package:provide/provide.dart';

/*
 * 书架
 */
class BookRackPage extends StatelessWidget {
  ///创建控制器的实例
  final PageController pageController = new PageController(
    ///用来配置PageView中默认显示的页面 从0开始
    initialPage: 0,
    ///为true是保持加载的每个页面的状态
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              BookRackTopTabArea(pageController),
              BookRackBottomListArea(pageController),
            ],
          )),
    );
  }
}
