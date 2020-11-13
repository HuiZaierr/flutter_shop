class LoginBean {
  int code;
  String msg;
  Data data;

  LoginBean({this.code, this.msg, this.data});

  LoginBean.fromJson(Map<String, dynamic> json) {
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
  int userId;
  String mobile;
  String nickname;
  String avatar;
  int gender;
  String birthday;
  String briefIntroduction;
  String userSign;
  String token;
  int firstLogin;
  int newUser;
  String newUserMsg;
  int rewardIntegral;

  Data(
      {this.userId,
      this.mobile,
      this.nickname,
      this.avatar,
      this.gender,
      this.birthday,
      this.briefIntroduction,
      this.userSign,
      this.token,
      this.firstLogin,
      this.newUser,
      this.newUserMsg,
      this.rewardIntegral});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mobile = json['mobile'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    gender = json['gender'];
    birthday = json['birthday'];
    briefIntroduction = json['brief_introduction'];
    userSign = json['userSign'];
    token = json['token'];
    firstLogin = json['firstLogin'];
    newUser = json['newUser'];
    newUserMsg = json['newUserMsg'];
    rewardIntegral = json['rewardIntegral'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['mobile'] = this.mobile;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['brief_introduction'] = this.briefIntroduction;
    data['userSign'] = this.userSign;
    data['token'] = this.token;
    data['firstLogin'] = this.firstLogin;
    data['newUser'] = this.newUser;
    data['newUserMsg'] = this.newUserMsg;
    data['rewardIntegral'] = this.rewardIntegral;
    return data;
  }
}
