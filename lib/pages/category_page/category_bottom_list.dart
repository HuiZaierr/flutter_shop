import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/config/constans.dart';
import 'package:flutter_shop/provide/category_bottom_list_provide.dart';
import 'package:provide/provide.dart';

/*
 * 分类底部列表
 */
class CategoryBottomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<CategoryBottomProvide>(builder: (context, child, data) {
      return Container(
        width: ScreenUtil().setWidth(1080),
        child: ListView.builder(
            shrinkWrap: true,
            physics: new NeverScrollableScrollPhysics(),
            itemCount: data.categoryBottomList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print("点击当前位置为：${data.categoryBottomList[index].id}");
                  Application.router.navigateTo(context,
                      "${Constans.detail}?cartoonid=${data.categoryBottomList[index].id}");
                },
                child: Row(
                  children: <Widget>[
                    _InkWellLeft(data.categoryBottomList, index),
                    _InkWellRight(data.categoryBottomList, index),
                  ],
                ),
              );
            }),
      );
    });
  }
}


/*
  * 左侧图片
  */
_InkWellLeft(List newList, int index) {
  String img = newList[index].coverImg.toString();
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
    height: ScreenUtil().setHeight(370),
    width: ScreenUtil().setWidth(335),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(6),
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
_InkWellRight(List newList, int index) {
  return Container(
    height: ScreenUtil().setHeight(365),
    width: ScreenUtil().setWidth(630),
    child: Column(
      children: <Widget>[
        _Title(newList[index].cartoonName),
        _Author("作者：${newList[index].author.authorName}"),
        _UpdateState(
            newList[index].ifFinish == 1
                ? "更新至${newList[index].totalChapter}话"
                : "全${newList[index].totalChapter}话",
            newList[index].ifFinish == 1 ? false : true),
        _Describe(newList[index].description)
      ],
    ),
  );
}

_Title(String title) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(top: 4),
    child: Text(
      title,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(43),
          fontWeight: FontWeight.bold),
    ),
  );
}

_Author(String author) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(top: 20),
    child: Text(
      author,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.grey,
        fontSize: ScreenUtil().setSp(32),
      ),
    ),
  );
}

_UpdateState(String updateState, bool isFinish) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(top: 20),
    child: Text(
      updateState,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: isFinish ? Colors.orange : Colors.blue,
        fontSize: ScreenUtil().setSp(33),
      ),
    ),
  );
}

_Describe(String describe) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(top: 20),
    child: Text(
      describe,
      textAlign: TextAlign.left,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.grey,
        fontSize: ScreenUtil().setSp(32),
      ),
    ),
  );
}


