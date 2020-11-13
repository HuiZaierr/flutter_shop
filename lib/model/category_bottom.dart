class CategoryBottomBean {
  int code;
  String msg;
  Data data;

  CategoryBottomBean({this.code, this.msg, this.data});

  CategoryBottomBean.fromJson(Map<String, dynamic> json) {
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
  int totalpage;
  int currentPage;
  List<CategoryList> list;

  Data({this.totalpage, this.currentPage, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    totalpage = json['totalpage'];
    currentPage = json['currentPage'];
    if (json['list'] != null) {
      list = new List<CategoryList>();
      json['list'].forEach((v) {
        list.add(new CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalpage'] = this.totalpage;
    data['currentPage'] = this.currentPage;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  int id;
  String cartoonName;
  String description;
  Author author;
  int ifFinish;
  String coverImg;
  int totalChapter;
  String popularity;
  int ifTop;
  String top;
  int ggao;

  CategoryList(
      {this.id,
      this.cartoonName,
      this.description,
      this.author,
      this.ifFinish,
      this.coverImg,
      this.totalChapter,
      this.popularity,
      this.ifTop,
      this.top,
      this.ggao});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartoonName = json['cartoon_name'];
    description = json['description'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    ifFinish = json['if_finish'];
    coverImg = json['cover_img'];
    totalChapter = json['total_chapter'];
    popularity = json['popularity'];
    ifTop = json['if_top'];
    top = json['top'];
    ggao = json['ggao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cartoon_name'] = this.cartoonName;
    data['description'] = this.description;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['if_finish'] = this.ifFinish;
    data['cover_img'] = this.coverImg;
    data['total_chapter'] = this.totalChapter;
    data['popularity'] = this.popularity;
    data['if_top'] = this.ifTop;
    data['top'] = this.top;
    data['ggao'] = this.ggao;
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
