import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static show(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_SHORT);
  }
}
