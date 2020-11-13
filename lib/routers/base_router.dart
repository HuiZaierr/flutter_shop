import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../ui/detail_page.dart';
import './router_handler.dart';
import '../config/constans.dart';

class BaseRouter {
  static void configuerRouters(Router router) {
    //如果没有找到路由，我们给创建一个空页面比如404等公共的
    router.notFoundHandler = Handler(
      handlerFunc: (context, parameters) {
        print("未找到相应的路由信息");
      },
    );
    //之后只需要引用这一句话就行
    router.define(Constans.detail, handler: detailsHandler); //详情
    router.define(Constans.login, handler: loginHandler); //登录
  }
}
