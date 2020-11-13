import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/home_recommend.dart';
import 'package:flutter_shop/provide/current_Index_provide.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import '../../provide/home_recommend_provide.dart';
import '../../r.dart';

/*
 * 首页底部数据
 */
class HomeBottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<HomeRecommendProvide>(
      builder: (context, child, data) {
        var modulesData = data.modulesList;
        if (modulesData.length > 0 && modulesData != null) {
          return Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: _widgetList(modulesData, context),
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

  _widgetList(List<ModulesData> list, BuildContext context) {
    List<Widget> widgetList = [];
    //数据过滤
    for (var i = 0; i < list.length; i++) {
      if (list[i].styleType == 5 || list[i].cartoons.length == 0) {
        list.removeAt(i);
      }
    }
    //遍历添加数据
    for (var i = 0; i < list.length; i++) {
      var styleType = list[i].styleType;
      var modulesData = list[i];
      switch (styleType) {
        case 99: //猜你喜欢
          widgetList
            ..add(_Title(modulesData))
            ..add(_GuessLiskBottom(modulesData.cartoons));
          break;
        case 1: //编辑力推
          widgetList
            ..add(_Title(modulesData))
            ..add(_OneAndSix(modulesData.extraCartoon, modulesData.cartoons))
            ..add(_PublishBottomLookMoreAndChange(modulesData.moduleId));
          break;
        case 2: //6个
          widgetList
            ..add(_Title(modulesData))
            ..add(_SixImage(modulesData.cartoons))
            ..add(_PublishBottomLookMoreAndChange(modulesData.moduleId));
          break;
        case 4: //随便看看最底部3个
          widgetList
            ..add(_Title(modulesData))
            ..add(_ThreeImage(modulesData.cartoons, context))
            ..add(_PublishBottomLookMoreAndChange(modulesData.moduleId))
            ..add(_BottomNoMoreImage(context));
          break;
        case 8: //神神秘秘4个
          widgetList
            ..add(_Title(modulesData))
            ..add(_FourImage(modulesData.cartoons))
            ..add(_PublishBottomLookMoreAndChange(modulesData.moduleId));
          break;
      }
    }
    return widgetList;
  }

//============================== 猜你喜欢开始 ===================================
/*
 * 猜你喜欢
 */
  _Title(ModulesData data) {
    return Container(
      child: Column(
        children: <Widget>[
          _publishTitle(data.moduleIcon, data.moduleName, data.moduleInfo,
              data.styleType == 99 ? true : false),
        ],
      ),
    );
  }

  _publishTitle(String url, String title, String moduleInfo, isGuessLisk) {
    return Container(
      decoration: isGuessLisk
          ? BoxDecoration(borderRadius: BorderRadius.circular(20))
          : BoxDecoration(borderRadius: BorderRadius.circular(0)),
      height: ScreenUtil().setHeight(100),
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Center(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 7),
              child: Image.network(
                url,
                width: ScreenUtil().setHeight(55),
                height: ScreenUtil().setWidth(55),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(50),
                  fontWeight: FontWeight.bold),
            ),
            isGuessLisk
                ? Text("")
                : Container(
                    margin: EdgeInsets.only(left: 5, top: 3),
                    child: Text(moduleInfo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: ScreenUtil().setSp(35))),
                  ),
            isGuessLisk
                ? Container(
                    alignment: Alignment.centerRight,
                    width: ScreenUtil().setWidth(720),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "查看更多",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER);
                          },
                          child: Text(
                            "查看更多",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(35),
                                color: Colors.black54),
                          ),
                        )
                      ],
                    ),
                  )
                : Text("")
          ],
        ),
      ),
    );
  }

  /*
   * 猜你喜欢底部数据
   */
  _GuessLiskBottom(List<Cartoons> data) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      height: ScreenUtil().setHeight(280),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _ItemGuessLike(data, index);
        },
      ),
    );
  }

  /*
  * 猜你喜欢item
  */
  _ItemGuessLike(List<Cartoons> data, int index) {
    return Container(
      width: ScreenUtil().setWidth(350),
      margin: EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(
              msg: "猜你想看点击第${index}个", toastLength: Toast.LENGTH_SHORT);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _Image(data, index),
            _Name(data[index].cartoonName),
            _Status(data, index),
          ],
        ),
      ),
    );
  }

  /*
   * 猜你喜欢图片
   */
  _Image(List<Cartoons> data, int index) {
    return Container(
      height: ScreenUtil().setHeight(160),
      width: ScreenUtil().setWidth(350),
      margin: EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          data[index].coverImg,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

/*
 * 猜你喜欢名称
 */
  _Name(String name) {
    return Container(
      margin: EdgeInsets.only(left: 2, bottom: 3, right: 5),
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(35)),
      ),
    );
  }

  /*
  * 猜你喜欢图标 
  */
  _Status(List<Cartoons> data, int index) {
    var isFinish = data[index].ifFinish;
    return Container(
      margin: EdgeInsets.only(left: 2, bottom: 3, right: 5),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Text(
            "${data[index].lastChapterNum}话/",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(35), color: Colors.black45),
          ),
          Text(
            "${data[index].totalChapter}话",
            style: TextStyle(
                color: Colors.orange, fontSize: ScreenUtil().setSp(35)),
          ),
          isFinish == 1
              ? Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Image.asset(
                    R.assetsImgIconContentsNew,
                    width: ScreenUtil().setWidth(60),
                    height: ScreenUtil().setHeight(20),
                  ),
                )
              : Text("")
        ],
      ),
    );
  }
}
//============================== 猜你喜欢结束 ===================================

//============================== 编辑力推开始 ===================================

_OneAndSix(List<ExtraCartoon> data, List<Cartoons> list) {
  return Container(
      child: Column(
    children: <Widget>[
      _One(data),
      _SixImage(list),
    ],
  ));
}

_One(List<ExtraCartoon> data) {
  return Container(
    margin: EdgeInsets.only(left: 5, right: 5),
    child: InkWell(
      onTap: () {
        Fluttertoast.showToast(
            msg: "编辑力推顶部图片",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)), //设置圆角
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _OneImage(data[0].coverImg),
            _OneName(data[0].cartoonName),
            _OneDescribe(data[0].description)
          ],
        ),
      ),
    ),
  );
}

/*
 * 编辑力推顶部漫画图片
 */
_OneImage(String url) {
  return Container(
    height: ScreenUtil().setHeight(430),
    width: ScreenUtil().setWidth(1080),
    margin: EdgeInsets.only(bottom: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5), topRight: Radius.circular(5)),
      child: Image.network(
        url,
        fit: BoxFit.fill,
      ),
    ),
  );
}

/*
 * 编辑力推顶部漫画名
 */
_OneName(String name) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 5, bottom: 5, right: 20),
    child: Text(
      name,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: ScreenUtil().setSp(40), color: Colors.black87),
    ),
  );
}

/*
 * 编辑力推顶部漫描述
 */
_OneDescribe(String describe) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 5, bottom: 5, right: 20),
    child: Text(
      describe,
      textAlign: TextAlign.start,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.black54),
    ),
  );
}

/*
 * 6个图片
 */
_SixImage(List<Cartoons> list) {
  return Container(
    margin: EdgeInsets.only(left: 5, right: 5),
    child: Wrap(
      spacing: 3,
      children: _ImageSixList(list),
    ),
  );
}

_ImageSixList(List<Cartoons> list) {
  List<Widget> widgetList = [];
  for (var i = 0; i < list.length; i++) {
    widgetList.add(Container(
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(
              msg: "六张图的第${i}个",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER);
        },
        child: Column(
          children: <Widget>[
            _SixTopImage(list[i].coverImg),
            _SixTopName(list[i].cartoonName),
            _SixTopCategory(list[i].category),
          ],
        ),
      ),
    ));
  }
  return widgetList;
}

_SixTopImage(String url) {
  return Container(
    width: ScreenUtil().setWidth(314),
    height: ScreenUtil().setHeight(340),
    margin: EdgeInsets.only(top: 10, left: 3, right: 3, bottom: 10),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          url,
          fit: BoxFit.fill,
        )),
  );
}

_SixTopName(String name) {
  return Container(
    width: ScreenUtil().setWidth(314),
    margin: EdgeInsets.only(bottom: 5, right: 5),
    padding: EdgeInsets.only(left: 5),
    child: Text(
      name,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: ScreenUtil().setSp(42), color: Colors.black87),
    ),
  );
}

_SixTopCategory(String category) {
  return Container(
    width: ScreenUtil().setWidth(314),
    margin: EdgeInsets.only(bottom: 5, right: 5),
    padding: EdgeInsets.only(left: 5),
    child: Text(
      category,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Colors.black54),
    ),
  );
}

//============================== 编辑力推结束 ===================================

//============================== 神神秘秘开始 ===================================
_FourImage(List<Cartoons> list) {
  return Container(
    child: Wrap(
      spacing: 2,
      children: _ImageFourList(list),
    ),
  );
}

_ImageFourList(List<Cartoons> list) {
  List<Widget> widgetList = [];
  for (var i = 0; i < list.length; i++) {
    widgetList.add(InkWell(
      onTap: () {
        Fluttertoast.showToast(
            msg: "点击了神神秘秘第${i}个",
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_SHORT);
      },
      child: Container(
        margin: EdgeInsets.only(left: 5, bottom: 10, right: 5),
        width: ScreenUtil().setWidth(490),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: <Widget>[
              _FourTopImage(list[i].coverImg), //图片
              _FourName(list[i].cartoonName),
              _FourDescribe(list[i].description),
            ],
          ),
        ),
      ),
    ));
  }
  return widgetList;
}

_FourTopImage(String url) {
  return Container(
    alignment: Alignment.topLeft,
    margin: EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5), topRight: Radius.circular(5))),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5), topRight: Radius.circular(5)),
      child: Image.network(
        url,
        width: ScreenUtil().setWidth(480),
        height: ScreenUtil().setHeight(460),
        fit: BoxFit.fill,
      ),
    ),
  );
}

_FourName(String name) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(bottom: 5),
    padding: EdgeInsets.only(left: 5),
    child: Text(
      name,
      style: TextStyle(fontSize: ScreenUtil().setSp(40), color: Colors.black87),
    ),
  );
}

_FourDescribe(String describe) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(bottom: 5),
    padding: EdgeInsets.only(left: 5, right: 8),
    child: Text(
      describe,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Colors.black54),
    ),
  );
}

//============================== 神神秘秘结束 ===================================

//============================== 随便看看开始 ===================================
_ThreeImage(List<Cartoons> list, BuildContext context) {
  return Container(
    width: ScreenUtil().setWidth(1080),
    child: MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _InkWellThreeItem(list, index);
        },
      ),
    ),
  );
}

_InkWellThreeItem(List<Cartoons> list, int index) {
  return InkWell(
    onTap: () {
      Fluttertoast.showToast(msg: "随便看看第${index}个");
    },
    child: Container(
      height: ScreenUtil().setHeight(370),
      width: ScreenUtil().setWidth(1080),
      margin: EdgeInsets.only(left: 10, bottom: 5, right: 10),
      child: Row(
        children: <Widget>[
          _InkWellLeft(list, index),
          _InkWellRight(list, index),
        ],
      ),
    ),
  );
}

/*
  * 左侧图片
  */
_InkWellLeft(List newList, int index) {
  String img = newList[index].coverImg.toString();
  return Container(
    margin: EdgeInsets.fromLTRB(0, 0, 10, 5),
    height: ScreenUtil().setHeight(380),
    width: ScreenUtil().setWidth(335),
    alignment: Alignment.topLeft,
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
_InkWellRight(List newList, int index) {
  return Container(
    height: ScreenUtil().setHeight(380),
    width: ScreenUtil().setWidth(620),
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
    alignment: Alignment.topLeft,
    padding: EdgeInsets.only(top: 8),
    child: Text(
      title,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(48),
          fontWeight: FontWeight.bold),
    ),
  );
}

_Author(String author) {
  return Container(
    alignment: Alignment.topLeft,
    padding: EdgeInsets.only(top: 19),
    child: Text(
      author,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black54,
        fontSize: ScreenUtil().setSp(32),
      ),
    ),
  );
}

_UpdateState(String updateState, bool isFinish) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(top: 19),
    child: Text(
      updateState,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: isFinish ? Colors.orange : Colors.blue,
        fontSize: ScreenUtil().setSp(32),
      ),
    ),
  );
}

_Describe(String describe) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(top: 15),
    child: Text(
      describe,
      textAlign: TextAlign.left,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black54,
        fontSize: ScreenUtil().setSp(32),
      ),
    ),
  );
}

//============================== 随便看看结束 ===================================

_BottomNoMoreImage(BuildContext context) {
  return InkWell(
    onTap: () {
      Provide.value<CurrentIndexProvide>(context).changeIndex(1);
    },
    child: Container(
      margin: EdgeInsets.only(top: 25, bottom: 20),
      alignment: Alignment.center,
      child: Image.asset(
        R.assetsImgRecommendBottomFoot,
        width: 770,
        height: 45,
      ),
    ),
  );
}

//============================== 查看更多  换一换开始 ===============================
_PublishBottomLookMoreAndChange(int modelId) {
  return Container(
    margin: EdgeInsets.only(
        bottom: 5,
        left: ScreenUtil().setWidth(100),
        right: ScreenUtil().setWidth(100),
        top: 10),
    child: Row(
      children: <Widget>[_LefrMore(modelId), _RightChange(modelId)],
    ),
  );
}

_LefrMore(int modelId) {
  return InkWell(
    onTap: () {
      Fluttertoast.showToast(msg: "查看更多", gravity: ToastGravity.CENTER);
    },
    child: Container(
      width: ScreenUtil().setWidth(385),
      height: ScreenUtil().setHeight(85),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(238, 238, 238, 1)),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(96),
                right: ScreenUtil().setWidth(25)),
            padding: EdgeInsets.only(top: 1.5),
            child: Image.asset(
              R.assetsImgRecommendChangeMore,
              width: ScreenUtil().setWidth(35),
              height: ScreenUtil().setWidth(35),
            ),
          ),
          Text(
            "查看更多",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(32), color: Colors.black87),
          )
        ],
      ),
    ),
  );
}

_RightChange(int modelId) {
  return InkWell(
    onTap: () {
      Fluttertoast.showToast(msg: "换一批", gravity: ToastGravity.CENTER);
    },
    child: Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(75)),
      width: ScreenUtil().setWidth(385),
      height: ScreenUtil().setHeight(85),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(238, 238, 238, 1)),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(115),
                right: ScreenUtil().setWidth(25)),
            padding: EdgeInsets.only(top: 1.5),
            child: Image.asset(
              R.assetsImgRecommendChange,
              width: ScreenUtil().setWidth(35),
              height: ScreenUtil().setWidth(35),
            ),
          ),
          Text(
            "换一批",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(32), color: Colors.black87),
          )
        ],
      ),
    ),
  );
}

//============================== 查看更多  换一换结束 ===============================
