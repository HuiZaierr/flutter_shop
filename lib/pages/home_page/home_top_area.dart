import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provide/provide.dart';
import '../../provide/home_recommend_provide.dart';

/*
 * 首页轮播图
 */
class HomeTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<HomeRecommendProvide>(
      builder: (context, child, data) {
        var bannerData = data.bannerList;
        if (bannerData != null && bannerData.length > 0) {
          return Container(
            width: ScreenUtil().setWidth(1080),
            height: ScreenUtil().setHeight(680),
            child: Swiper(
              itemCount: bannerData.length,
              itemBuilder: (context, index) {
                return Image.network(
                  bannerData[index].bannerImg,
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              autoplayDelay: 5000,
            ),
          );
        } else {
          return Center(
            child: Text("暂无数据"),
          );
        }
      },
    );
  }
}