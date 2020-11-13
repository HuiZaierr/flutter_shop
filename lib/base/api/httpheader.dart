import 'package:flutter_shop/provide/login_provide.dart';
import 'package:flutter_shop/base/application.dart';
import 'package:provide/provide.dart';
import '../../config/constans.dart';
import 'package:convert/convert.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

var header = {
  // Constans.SIGN: "c8cb5e4e9e20e2ecf9a24ed22037414d",
  Constans.SIGN: getSign(),
  Constans.TIME: DateTime.now().millisecondsSinceEpoch,
  Constans.APTYPE: '2',
  Constans.DID: '862776046517613', //设备IMEI
  Constans.ANDROIDID: '4031e631d0e1e86c', //AndroidId
  Constans.CONN: '0',
  Constans.CARRIER: '0', //获取运营商
  Constans.VOS: '9',
  Constans.APPVER: '1.7.0',
  Constans.MODEL: 'MRD-AL00',
  Constans.VENDOR: 'HUAWEI',
  Constans.PACKAGE_NAME: 'com.mu.cartoon.app',
  Constans.APP_ID: 'SJMHSW0001',
  Constans.CHANNELID: 'DEV',
  Constans.OAID: '388dc265a3f04899bb3cec6dd524eed3',
  Constans.TOKEN: Provide.value<LoginProvide>(Application.context).token,
  // Constans.TOKEN:'+Q2W6WGZPO6A1N5ULQDcGSXLorh0Qj2rNnr+yMVxHmHixRef/K4NxsuGHiHmYJ5T',
  Constans.REQUESTID: '061f24b2855c1fcb909ad5cd60466fc2',
};

var noLoginheader = {
  Constans.SIGN: getSign(),
  Constans.TIME: DateTime.now().millisecondsSinceEpoch,
  Constans.APTYPE: '2',
  Constans.DID: '862776046517613', //设备IMEI
  Constans.ANDROIDID: '4031e631d0e1e86c', //AndroidId
  Constans.CONN: '0',
  Constans.CARRIER: '0', //获取运营商
  Constans.VOS: '9',
  Constans.APPVER: '1.7.0',
  Constans.MODEL: 'MRD-AL00',
  Constans.VENDOR: 'HUAWEI',
  Constans.PACKAGE_NAME: 'com.mu.cartoon.app',
  Constans.APP_ID: 'SJMHSW0001',
  Constans.CHANNELID: 'DEV',
  Constans.OAID: '388dc265a3f04899bb3cec6dd524eed3',
  Constans.REQUESTID: '061f24b2855c1fcb909ad5cd60466fc2',
};

StringBuffer stringBuffer;
String str = "";

getSign() {
  stringBuffer = StringBuffer();
  stringBuffer
    ..write(Constans.TIME)
    ..write("=${DateTime.now().millisecondsSinceEpoch}&")
    ..write(Constans.APTYPE)
    ..write("=2&")
    ..write(Constans.DID)
    ..write("=862776046517613&")
    ..write(Constans.ANDROIDID)
    ..write("=4031e631d0e1e86c&")
    ..write(Constans.CONN)
    ..write('=0&')
    ..write(Constans.CARRIER)
    ..write('=0&')
    ..write(Constans.VOS)
    ..write('=9&')
    ..write(Constans.APPVER)
    ..write('=1.7.0&')
    ..write(Constans.MODEL)
    ..write('=MRD-AL00&')
    ..write(Constans.VENDOR)
    ..write('=HUAWEI&')
    ..write(Constans.PACKAGE_NAME)
    ..write('=com.mu.cartoon.app&')
    ..write(Constans.APP_ID)
    ..write('=SJMHSW0001&')
    ..write(Constans.CHANNELID)
    ..write('=DEV&')
    ..write(Constans.OAID)
    ..write("=388dc265a3f04899bb3cec6dd524eed3");
  if (Provide.value<LoginProvide>(Application.context).isLogin) {
    stringBuffer.write(
        "&${Constans.TOKEN}=${Provide.value<LoginProvide>(Application.context).token}");
  }
  str = generateMd5(stringBuffer.toString());
  str = str.toUpperCase();
  str = generateMd5(str + "cartoon123");
  str = str.toLowerCase();
  print("当前签名后为：${str}");
  return str;
}

// md5 加密
String generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  // 这里其实就是 digest.toString()
  return hex.encode(digest.bytes);
}
