import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/book_current_provide.dart';
import 'package:flutter_shop/ui/collect_page.dart';
import 'package:flutter_shop/ui/history_page.dart';
import 'package:provide/provide.dart';

class BookRackBottomListArea extends StatelessWidget {
  ///创建控制器的实例
  final PageController pageController;

  BookRackBottomListArea(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Provide<BookCurrentIndexProvide>(builder: (context, child, value) {
      return Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(1790),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            Provide.value<BookCurrentIndexProvide>(context)
                .setCurrentIndex(index);
          },
          children: <Widget>[
            HistoryPage(),
            CollectPage()],
        ),
      );
    });
  }
}
