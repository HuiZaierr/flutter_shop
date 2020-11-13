import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/ui/login_page.dart';
import '../ui/detail_page.dart';

/*
 * 单个路由配置
 */
Handler detailsHandler = Handler(
  handlerFunc: (context, parameters) {
    String cartoonId = parameters['cartoonid'].first;
    print("漫画id值为：${cartoonId}");
    return DetailPage(int.parse(cartoonId));
  },
);

//登录页面
Handler loginHandler = Handler(
  handlerFunc: (context, parameters) {
    return LoginPage();
  },
);
