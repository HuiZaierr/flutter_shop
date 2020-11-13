import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/base/api/api_method.dart';
import 'package:flutter_shop/model/history_list.dart';
import 'package:flutter_shop/provide/history_list_provide.dart';
import 'package:flutter_shop/r.dart';
import 'package:flutter_shop/utils/toast_utils.dart';
import 'package:provide/provide.dart';

/*
 * 历史列表数据
 */
class HistoryPageListArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<HistoryListProvide>(builder: (context,child,value){
        return Container(
          margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(210)),
          child: EasyRefresh(
            child: ListView.builder(
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                itemCount: value.historyList.length,
                itemBuilder: (context,index){
                  return ItemView(value.historyList,index);
                }),
            onRefresh: () async{
              Provide.value<HistoryListProvide>(context).setPage(1);
               getHistoryInfo(true);
            },
            onLoad: () async{
              if(value.page<value.totalpage){
                Provide.value<HistoryListProvide>(context).addPage();
                getHistoryInfo(false);
              }
            },
          ),
        );
    });
  }
}


ItemView(List<HistoryList> data,int index){
  return InkWell(
    onTap: () {
      print("点击当前位置为：${data[index].id}");
    },
    child: Row(
      children: <Widget>[
          Stack(
            children: <Widget>[
              _InkWellLeft(data, index),
              _UpdateImage(data[index].ifUpdate)
            ],
          ),
//        _InkWellLeft(data, index),
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
    margin: EdgeInsets.fromLTRB(14, 0, 13, 10),
    height: ScreenUtil().setHeight(360),
    width: ScreenUtil().setWidth(330),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image(
        fit: BoxFit.fill,
        image: NetworkImage(newList[index].coverImg),
      ),
    ),
  );
}

//更新图标
_UpdateImage(int isUpdate) {
  return Container(
    margin: EdgeInsets.fromLTRB(14, 0, 13, 10),
    child: isUpdate == 1?Image.asset(R.assetsImgHistortUpdateLogo,width: ScreenUtil().setWidth(110),height: ScreenUtil().setWidth(110)):Text(""),
  );
}




/*
 * 右侧数据
 */
_InkWellRight(List<HistoryList> newList, int index) {
  return Container(
    height: ScreenUtil().setHeight(360),
    width: ScreenUtil().setWidth(630),
    child: Column(
      children: <Widget>[
        _Title(newList[index].cartoonName),
        _StartRead("续看"),
        _UpdateState(
            newList[index].ifFinish == 1
                ? "更新至${newList[index].totalChapter}话"
                : "全${newList[index].totalChapter}话",
            newList[index].ifFinish == 1 ? false : true),
        _LookCurrentTalk("看至第${newList[index].lastChapterNum}话"),
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

_StartRead(String text){
  return InkWell(
    onTap: (){
      ToastUtils.show(text);
    },
    child: Container(
      height: ScreenUtil().setHeight(58),
      width: ScreenUtil().setWidth(160),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(63),left: ScreenUtil().setHeight(340)),
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
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(top: 2),
    child: Text(
      updateState,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.grey,
        fontSize: ScreenUtil().setSp(31),
      ),
    ),
  );
}

_LookCurrentTalk(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(top: 5),
    child: Text(
      text,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.grey,
        fontSize: ScreenUtil().setSp(31),
      ),
    ),
  );
}