import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/pages/category_page.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/provide/book_current_provide.dart';
import 'package:flutter_shop/provide/category_top_provide.dart';
import 'package:flutter_shop/provide/collect_list_provide.dart';
import 'package:flutter_shop/provide/history_list_provide.dart';
import 'package:flutter_shop/provide/integral_detail_provide.dart';
import 'package:flutter_shop/provide/mine_userreadinfo_provide.dart';
import 'package:flutter_shop/provide/sort_top_provide.dart';
import 'package:flutter_shop/provide/status_top_provide.dart';
import 'package:flutter_shop/provide/login_provide.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/routers/base_router.dart';
import 'package:flutter_shop/utils/sp_utils.dart';
import 'package:provide/provide.dart';
import 'provide/category_bottom_list_provide.dart';
import './provide/home_recommend_provide.dart';
import 'provide/current_Index_provide.dart';

void main() {
  var providers = Providers();
  var categoryProvide = CategoryProvide();
  var statusProvide = StatusProvide();
  var sortProvide = SortProvide();
  var categoryBottomProvide = CategoryBottomProvide();
  var homeRecommendProvide = HomeRecommendProvide();
  var currentIndexProvide = CurrentIndexProvide();
  var loginProvide = LoginProvide();
  var mineUserReadInfoProvide = MineUserReadInfoProvide();
  var integralDetailProvide = IntegralDetailProvide();
  var bookCurrentIndexProvide = BookCurrentIndexProvide();
  var collectListProvide = CollectListProvide();
  var historyListProvide = HistoryListProvide();
  providers
    ..provide(Provider<CategoryProvide>.value(categoryProvide))
    ..provide(Provider<StatusProvide>.value(statusProvide))
    ..provide(Provider<SortProvide>.value(sortProvide))
    ..provide(Provider<CategoryBottomProvide>.value(categoryBottomProvide))
    ..provide(Provider<HomeRecommendProvide>.value(homeRecommendProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
    ..provide(Provider<LoginProvide>.value(loginProvide))
    ..provide(Provider<MineUserReadInfoProvide>.value(mineUserReadInfoProvide))
    ..provide(Provider<IntegralDetailProvide>.value(integralDetailProvide))
    ..provide(Provider<CollectListProvide>.value(collectListProvide))
    ..provide(Provider<HistoryListProvide>.value(historyListProvide))
    ..provide(Provider<BookCurrentIndexProvide>.value(bookCurrentIndexProvide));
  runApp(
    ProviderNode(
      providers: providers,
      child: MyApp(),
    ),
  );
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //把Router注入进去
    final router = Router();
    BaseRouter.configuerRouters(router);
    Application.router = router;
    Application.context = context;
    SPUtils.getLoginInfo();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        child: MaterialApp(
          onGenerateRoute: Application.router.generator,
          title: "Flutter Shop",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.pink),
          home: IndexPage(),
        ),
      ),
    );
  }
}
