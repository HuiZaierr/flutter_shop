import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/model/history_list.dart';
import 'package:flutter_shop/provide/current_Index_provide.dart';
import 'package:flutter_shop/provide/history_list_provide.dart';
import 'package:flutter_shop/r.dart';
import 'package:flutter_shop/utils/toast_utils.dart';
import 'package:provide/provide.dart';

/*
 * 历史空数据
 */
class HistoryPageEmptyArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
        children: <Widget>[
          TopEmpty(),
          BottomEmpty(),
        ],
      )),
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

//-------------------- 顶部空视图 -------------------------
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
        child: Text("赶紧去行动吧>>",style: TextStyle(fontSize: ScreenUtil().setSp(38),color: Colors.orange),)
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

//------------------- 底部列表 -------------------------
BottomEmpty(){
  return Provide<HistoryListProvide>(builder: (context,child,value){
    return Container(
      width: ScreenUtil().setWidth(1080),
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(210)),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: value.historyList.length,
          itemBuilder: (context, index){
            return ItemView(value.historyList,index);
          }),
    );
  });
}

ItemView(List<HistoryList> data,int index){
  return InkWell(
    onTap: () {
      print("点击当前位置为：${data[index].id}");
    },
    child: Row(
      children: <Widget>[
        _InkWellLeft(data, index),
        _InkWellRight(data, index),
      ],
    ),
  );
}

/*
  * 左侧图片
  */
_InkWellLeft(List<HistoryList> newList, int index) {
  String img = newList[index].coverImg.toString();
  return Container(
    margin: EdgeInsets.fromLTRB(14, 0, 10, 10),
    height: ScreenUtil().setHeight(380),
    width: ScreenUtil().setWidth(340),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image(
        fit: BoxFit.fill,
        image: NetworkImage(newList[index].coverImg),
      ),
    ),
  );
}

/*
 * 右侧数据
 */
_InkWellRight(List<HistoryList> newList, int index) {
  return Container(
    height: ScreenUtil().setHeight(380),
    width: ScreenUtil().setWidth(630),
    child: Column(
      children: <Widget>[
        _Title(newList[index].cartoonName),
        _Author("作者：${newList[index].author.authorName}"),
        _StartRead("开始阅读"),
        _UpdateState(
            newList[index].ifFinish == 1
                ? "更新至${newList[index].totalChapter}话"
                : "全${newList[index].totalChapter}话",
            newList[index].ifFinish == 1 ? false : true),
      ],
    ),
  );
}

//标题
_Title(String title) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(top: 10),
    child: Text(
      title,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(40),
          fontWeight: FontWeight.bold),
    ),
  );
}

_Author(String author) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(top: 8),
    child: Text(
      author,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.grey,
        fontSize: ScreenUtil().setSp(34),
      ),
    ),
  );
}

_StartRead(String text){
  return InkWell(
    onTap: (){
      ToastUtils.show(text);
    },
    child: Container(
      height: ScreenUtil().setHeight(58),
      width: ScreenUtil().setWidth(220),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(60),left: ScreenUtil().setHeight(300)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(252, 126, 42, 1)
      ),
      child: Text(text,style: TextStyle(fontSize: ScreenUtil().setSp(35),color: Colors.white)),
    ),
  );


}

_UpdateState(String updateState, bool isFinish) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(top: 24),
    child: Text(
      updateState,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: isFinish ? Colors.orange : Colors.blue,
        fontSize: ScreenUtil().setSp(34),
      ),
    ),
  );
}