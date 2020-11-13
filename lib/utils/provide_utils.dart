import 'package:flutter_shop/base/application.dart';
import 'package:flutter_shop/provide/login_provide.dart';
import 'package:provide/provide.dart';

class ProvideUtils {
  //是否登录
  static isLogin() {
    return Provide.value<LoginProvide>(Application.context).isLogin;
  }
}
