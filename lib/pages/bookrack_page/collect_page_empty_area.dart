import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/config/constans.dart';
import 'package:flutter_shop/r.dart';

/*
 * 收藏页面空视图
 */
class CollectPageEmptyArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: <Widget>[
           _Image(),
           _Text(),
           _Button(context)
         ],
       ),
    );
  }
}


_Image(){
  return Container(
    margin: EdgeInsets.only(top: ScreenUtil().setHeight(400)),
    child: Image.asset(R.assetsImgIvCollectNologinImg,height: ScreenUtil().setHeight(300)),
  );
}

_Text(){
  return Container(
    margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
    child: Text("登录后才可以看到收藏作品哟~",style: TextStyle(fontSize: ScreenUtil().setSp(38),color: Colors.black45),),
  );
}

_Button(BuildContext context){
  return InkWell(
    onTap: (){
      Application.router.navigateTo(context, Constans.login);
    },
    child: Container(
      height: ScreenUtil().setHeight(85),
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(5)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(252, 126, 42, 1)
      ),
      child: Text("去登录",style: TextStyle(fontSize: ScreenUtil().setSp(42),color: Colors.white)),
    ),
  );
}