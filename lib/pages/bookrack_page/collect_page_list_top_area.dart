import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/provide/collect_list_provide.dart';
import 'package:flutter_shop/provide/current_Index_provide.dart';
import 'package:flutter_shop/r.dart';
import 'package:provide/provide.dart';

class CollectPageListTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TopEmpty(),
    );
  }
}


TopEmpty(){
  return Container(
    width: ScreenUtil().setWidth(1080),
    child: Column(
      children: <Widget>[
        TopImage(),
        TopText(),
        TopTextGoCategort(),
        TopTextAllSee()
      ],
    ),
  );
}

TopImage(){
  return Container(
    margin: EdgeInsets.only(top: ScreenUtil().setHeight(90)),
    child: Image.asset(R.assetsImgIvBookcollectEmptyImg,height: ScreenUtil().setHeight(280)),
  );
}

TopText(){
  return Container(
    margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
    child: Text("哎呀！错过了好多精品漫画啊",style: TextStyle(fontSize: ScreenUtil().setSp(38),color: Colors.black45),),
  );
}

TopTextGoCategort(){
  return InkWell(
    onTap: (){
      Provide.value<CurrentIndexProvide>(Application.context).changeIndex(1);
    },
    child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(15),bottom: ScreenUtil().setHeight(40)),
        child: Text("赶紧去收藏吧>>",style: TextStyle(fontSize: ScreenUtil().setSp(38),color: Colors.orange),)
    ),
  );
}

TopTextAllSee(){
  return  Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(left:ScreenUtil().setHeight(35),top: ScreenUtil().setHeight(15),bottom: ScreenUtil().setHeight(15)),
        child: Text("圈内人都在看",style: TextStyle(fontSize: ScreenUtil().setSp(46),color: Colors.black87,fontWeight: FontWeight.w700))
    );
}