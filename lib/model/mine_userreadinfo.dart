class MineUserReadInfoBean {
  int code;
  String msg;
  Data data;

  MineUserReadInfoBean({this.code, this.msg, this.data});

  MineUserReadInfoBean.fromJson(Map<String, dynamic> json) {
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
  String readTime;
  int readOff;
  int haveRead;
  int commentNum;
  int exceedNum;

  Data(
      {this.readTime,
      this.readOff,
      this.haveRead,
      this.commentNum,
      this.exceedNum});

  Data.fromJson(Map<String, dynamic> json) {
    readTime = json['readTime'];
    readOff = json['readOff'];
    haveRead = json['haveRead'];
    commentNum = json['commentNum'];
    exceedNum = json['exceedNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['readTime'] = this.readTime;
    data['readOff'] = this.readOff;
    data['haveRead'] = this.haveRead;
    data['commentNum'] = this.commentNum;
    data['exceedNum'] = this.exceedNum;
    return data;
  }
}
