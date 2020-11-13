import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int cartoonId;

  DetailPage(this.cartoonId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("商品id：${cartoonId}"),
    );
  }
}
