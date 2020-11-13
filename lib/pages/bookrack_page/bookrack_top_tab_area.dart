import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/provide/book_current_provide.dart';
import 'package:flutter_shop/provide/current_Index_provide.dart';
import 'package:flutter_shop/utils/provide_utils.dart';
import 'package:provide/provide.dart';

/*
 * 书架顶部Tab
 */
class BookRackTopTabArea extends StatelessWidget {

  final PageController pageController;

  BookRackTopTabArea(this.pageController);

  @override
  Widget build(BuildContext context) {
    Provide.value<BookCurrentIndexProvide>(context).currentIndex==0?getHistoryInfo(true):getCollectInfo(true);
    return Container(
      height: ScreenUtil().setHeight(150),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: TopTab(context,pageController),
            top: 0,
          )
        ],
      ),
    );
  }
}

TopTab(BuildContext context,PageController pageController) {
  return Container(
    height: ScreenUtil().setHeight(140),
    child: Row(
      children: <Widget>[
        _History(context,pageController),
        _Collect(context,pageController),
      ],
    ),
  );
}

//历史
_History(BuildContext context,PageController pageController) {
  return Provide<BookCurrentIndexProvide>(builder: (context, child, value) {
    return InkWell(
      onTap: (){
        if(value.currentIndex!=0){
          getHistoryInfo(true);
          pageController.jumpToPage(0);
          Provide.value<BookCurrentIndexProvide>(context).setCurrentIndex(0);
        }
      },
      child: Container(
        width: ScreenUtil().setWidth(280),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 8,
                child: Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(280),
                  height: ScreenUtil().setHeight(100),
                  child: Text("历史",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: value.currentIndex == 0
                              ? ScreenUtil().setSp(70)
                              : ScreenUtil().setSp(55),
                          color: Colors.black87)),
                )),
            Positioned(
                top: 40,
                child: value.currentIndex == 0
                    ? Container(
                        width: ScreenUtil().setWidth(180),
                        height: ScreenUtil().setHeight(6),
                  margin: EdgeInsets.fromLTRB(18, 5, 12, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.orange,
                        ),
                      )
                    : Text(""))
          ],
        ),
      ),
    );
  });
}

//收藏
_Collect(BuildContext context,PageController pageController) {
  return Provide<BookCurrentIndexProvide>(
    builder: (context, child, value) {
      return InkWell(
        onTap: () {
          if(value.currentIndex!=1){
            if(ProvideUtils.isLogin()){
              getCollectInfo(true);
            }
            pageController.jumpToPage(1);
            Provide.value<BookCurrentIndexProvide>(context).setCurrentIndex(1);
          }
        },
        child: Container(
          width: ScreenUtil().setWidth(280),
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 8,
                  child: Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(280),
                    height: ScreenUtil().setHeight(100),
                    child: Text("收藏",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: value.currentIndex == 1
                                ? ScreenUtil().setSp(70)
                                : ScreenUtil().setSp(55),
                            color: Colors.black87)),
                  )),
              Positioned(
                  top: 40,
                  child: value.currentIndex == 1
                      ? Container(
                          width: ScreenUtil().setWidth(170),
                          height: ScreenUtil().setHeight(6),
                          margin: EdgeInsets.fromLTRB(18, 5, 12, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.orange,
                          ),
                        )
                      : Text(""))
            ],
          ),
        ),
      );
    },
  );
}
