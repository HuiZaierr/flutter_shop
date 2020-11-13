import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/home_page/home_bottom_area.dart';
import 'package:flutter_shop/pages/home_page/home_top_area.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/pages/home_page/home_top_corner_area.dart';
import 'package:flutter_shop/pages/mine_page/mine_info.area.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/home_recommend_provide.dart';

/*
 * 首页
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {

  ScrollController controller = ScrollController();
  bool isHideTop = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
//      print("当前滑动距离：${controller.offset.toInt()}");
      if(controller.offset.toInt()> 160 && !Provide.value<HomeRecommendProvide>(context).isHideTop){         //显示白色
        print("显示白色");
        Provide.value<HomeRecommendProvide>(context).changeHideTop(true);
      }else if(controller.offset.toInt() <160.0 && Provide.value<HomeRecommendProvide>(context).isHideTop){    //显示透明
        print("显示透明");
        Provide.value<HomeRecommendProvide>(context).changeHideTop(false);
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getHomeRecommendData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //如果有值
            return Provide<HomeRecommendProvide>(builder: (context,child,value){
              return  Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    controller: controller,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: ScreenUtil().setWidth(1080),
                            height: ScreenUtil().setHeight(680),
                            child: Stack(
                              children: <Widget>[
                                Positioned(child: HomeTopArea(),top: 0,),
                                Positioned(child:HomeTopCornerArea(),top: ScreenUtil().setHeight(660)),
                              ],
                            ),
                          ),
                          HomeBottomArea(),
                        ],
                      ),
                    ),
                  ),
                  AnimatedOpacity(opacity: value.isHideTop ? 0.0 : 1.0, duration: Duration(milliseconds: 100),child: TopWhite()),
                  AnimatedOpacity(opacity: value.isHideTop ? 1.0 : 0.0, duration: Duration(milliseconds: 100),child: TopBlack())
                ],
              );
            });
          } else {
            //没有数据时候加载页面
            return Center(
              child: Text(
                "正在加载中...",
                style: TextStyle(fontSize: 16),
              ),
            );
          }
        },
      ),
    );
  }
}
