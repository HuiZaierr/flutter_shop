import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/bookrack_page/collect_page_empty_area.dart';
import 'package:flutter_shop/pages/bookrack_page/collect_page_list_area.dart';
import 'package:flutter_shop/utils/provide_utils.dart';
import 'package:provide/provide.dart';

class CollectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProvideUtils.isLogin()?
//    CollectPageEmptyArea():CollectPageListArea();
    CollectPageListArea():CollectPageEmptyArea();
  }
}
