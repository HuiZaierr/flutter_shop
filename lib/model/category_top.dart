class CategortTopBean {
  int code;
  String msg;
  Data data;

  CategortTopBean({this.code, this.msg, this.data});

  CategortTopBean.fromJson(Map<String, dynamic> json) {
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
  List<Categorys> category;
  List<Status> status;
  List<Sort> sort;

  Data({this.category, this.status, this.sort});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = new List<Categorys>();
      json['category'].forEach((v) {
        category.add(new Categorys.fromJson(v));
      });
    }
    if (json['status'] != null) {
      status = new List<Status>();
      json['status'].forEach((v) {
        status.add(new Status.fromJson(v));
      });
    }
    if (json['sort'] != null) {
      sort = new List<Sort>();
      json['sort'].forEach((v) {
        sort.add(new Sort.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    if (this.status != null) {
      data['status'] = this.status.map((v) => v.toJson()).toList();
    }
    if (this.sort != null) {
      data['sort'] = this.sort.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categorys {
  int id;
  String value;

  Categorys({this.id, this.value});

  Categorys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}

class Status {
  int id;
  String value;

  Status({this.id, this.value});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}

class Sort {
  int id;
  String value;

  Sort({this.id, this.value});

  Sort.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}
