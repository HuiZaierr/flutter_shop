import 'package:flutter/cupertino.dart';

class IntegralDetailProvide with ChangeNotifier {
  int integralTotal = 0;
  int receiveIntegral = 0;
  int useIntegral = 0;
  int mayRead = 0;
  bool isSign = false;

  setIntegralDetail(int integralTotal, int receiveIntegral, int useIntegral,
      int mayRead, bool isSign) {
    this.integralTotal = integralTotal;
    this.receiveIntegral = receiveIntegral;
    this.useIntegral = useIntegral;
    this.mayRead = mayRead;
    this.isSign = isSign;
    notifyListeners();
  }
}
