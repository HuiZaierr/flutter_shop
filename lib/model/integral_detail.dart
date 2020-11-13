class IntegralDetailBean {
  int code;
  String msg;
  Data data;

  IntegralDetailBean({this.code, this.msg, this.data});

  IntegralDetailBean.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int integralTotal;
  int receiveIntegral;
  int useIntegral;
  int mayRead;
  bool isSign;

  Data(
      {this.integralTotal,
      this.receiveIntegral,
      this.useIntegral,
      this.mayRead,
      this.isSign});

  Data.fromJson(Map<String, dynamic> json) {
    integralTotal = json['integralTotal'];
    receiveIntegral = json['receiveIntegral'];
    useIntegral = json['useIntegral'];
    mayRead = json['mayRead'];
    isSign = json['isSign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['integralTotal'] = this.integralTotal;
    data['receiveIntegral'] = this.receiveIntegral;
    data['useIntegral'] = this.useIntegral;
    data['mayRead'] = this.mayRead;
    data['isSign'] = this.isSign;
    return data;
  }
}
