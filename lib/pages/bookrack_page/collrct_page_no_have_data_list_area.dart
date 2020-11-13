
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/collect_list.dart';
import 'package:flutter_shop/pages/bookrack_page/collect_page_list_bottom_area.dart';
import 'package:flutter_shop/pages/bookrack_page/collect_page_list_top_area.dart';
import 'package:flutter_shop/provide/collect_list_provide.dart';
import 'package:flutter_shop/r.dart';
import 'package:flutter_shop/utils/toast_utils.dart';
import 'package:provide/provide.dart';

class CollectPageNoHaveDataListArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView(
          children: <Widget>[
            CollectPageListTopArea(),
            CollectPageListBottomArea()
          ],
        ),
    );
  }
}

ItemViewList(List<CollectList> list){
  List<Widget> widgetList = [];
  for (int i = 0; i < list.length; i++) {
    widgetList.add(ItemView(list, i));
  }
  return widgetList;
}


ItemView(List<CollectList> list,int index){
   return InkWell(
     onTap: (){
       ToastUtils.show("点击第$index");
     },
     child: Container(
       margin: EdgeInsets.only(left: ScreenUtil().setWidth(8),right: ScreenUtil().setWidth(8)),
       child: Column(
         children: <Widget>[
           TopImage(list[index].coverImg),
           Title(list[index].cartoonName),
           BottomInfo(list,index)
         ],
       ),
     ),
   );
}

TopImage(String url){
    return Container(
      width: ScreenUtil().setWidth(310),
      height: ScreenUtil().setHeight(350),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            url,
            fit: BoxFit.fill,
          )),
    );
}

Title(String title){
   return Container(
     width: ScreenUtil().setWidth(310),
     margin: EdgeInsets.fromLTRB(1,0,3,3),
     child: Text(
         title,
       textAlign: TextAlign.start,
       maxLines: 1,
       overflow: TextOverflow.ellipsis,
       style: TextStyle(fontSize: ScreenUtil().setSp(37), color: Colors.black87,fontWeight: FontWeight.w700)),
   );
}

BottomInfo(List<CollectList> list,int index){
  return Container(
    width: ScreenUtil().setWidth(310),
    margin: EdgeInsets.fromLTRB(1,0,3,18),
    child: Row(
      children: <Widget>[
        UpdateText(list, index),
        UpdateImage()
      ],
    )
  );
}


UpdateText(List<CollectList> list,int index){
  return Container(
    child: RichText(
        text: TextSpan(
            text: list[index].lastChapterNum>0?"${list[index].lastChapterNum}话/":"未看/",
            style: TextStyle(fontSize: ScreenUtil().setSp(30),color: Colors.black38),
            children: <TextSpan>[
              TextSpan(
                text: "${list[index].totalChapter}话/",
                style: TextStyle(fontSize: ScreenUtil().setSp(30),color: list[index].ifUpdate == 1?Color(0xffff6d00):Colors.black38),
              ),
            ]
        )
    ),
  );

}

UpdateImage(){
  return Container(
    child: Image.asset(R.assetsImgIconContentsNew,width: ScreenUtil().setWidth(100),height: ScreenUtil().setHeight(40),),
  );
}
