
class HistoryListBean {
  int code;
  String msg;
  int type;
  Data data;

  HistoryListBean({this.code, this.msg, this.type, this.data});

  HistoryListBean.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int ps;
  int totalpage;
  int pno;
  List<HistoryList> historyList;

  Data({this.ps, this.totalpage, this.pno, this.historyList});

  Data.fromJson(Map<String, dynamic> json) {
    ps = json['ps'];
    totalpage = json['totalpage'];
    pno = json['pno'];
    if (json['list'] != null) {
      historyList = new List<HistoryList>();
      json['list'].forEach((v) {
        historyList.add(new HistoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ps'] = this.ps;
    data['totalpage'] = this.totalpage;
    data['pno'] = this.pno;
    if (this.historyList != null) {
      data['list'] = this.historyList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HistoryList {
  int id;
  String cartoonName;
  Author author;
  int ifFinish;
  String coverImg;
  int totalChapter;
  String popularity;
  int ifTop;
  String top;
  int lastView;
  int lastChapterNum;
  int ifUpdate;
  int lock;

  HistoryList(
      {this.id,
        this.cartoonName,
        this.author,
        this.ifFinish,
        this.coverImg,
        this.totalChapter,
        this.popularity,
        this.ifTop,
        this.top,
        this.lastView,
        this.lastChapterNum,
        this.ifUpdate,
        this.lock});

  HistoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartoonName = json['cartoon_name'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    ifFinish = json['if_finish'];
    coverImg = json['cover_img'];
    totalChapter = json['total_chapter'];
    popularity = json['popularity'];
    ifTop = json['if_top'];
    top = json['top'];
    lastView = json['last_view'];
    lastChapterNum = json['last_chapter_num'];
    ifUpdate = json['if_update'];
    lock = json['lock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cartoon_name'] = this.cartoonName;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['if_finish'] = this.ifFinish;
    data['cover_img'] = this.coverImg;
    data['total_chapter'] = this.totalChapter;
    data['popularity'] = this.popularity;
    data['if_top'] = this.ifTop;
    data['top'] = this.top;
    data['last_view'] = this.lastView;
    data['last_chapter_num'] = this.lastChapterNum;
    data['if_update'] = this.ifUpdate;
    data['lock'] = this.lock;
    return data;
  }
}

class Author {
  int authorId;
  String authorName;

  Author({this.authorId, this.authorName});

  Author.fromJson(Map<String, dynamic> json) {
    authorId = json['author_id'];
    authorName = json['author_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_id'] = this.authorId;
    data['author_name'] = this.authorName;
    return data;
  }
}
