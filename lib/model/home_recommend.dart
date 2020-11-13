class HomeRecommendBean {
  int code;
  String msg;
  HomeRecommendData data;

  HomeRecommendBean({this.code, this.msg, this.data});

  HomeRecommendBean.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null
        ? new HomeRecommendData.fromJson(json['data'])
        : null;
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

class HomeRecommendData {
  List<BannerData> banner;
  List<ModulesData> modules;

  HomeRecommendData({this.banner, this.modules});

  HomeRecommendData.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      banner = new List<BannerData>();
      json['banner'].forEach((v) {
        banner.add(new BannerData.fromJson(v));
      });
    }
    if (json['modules'] != null) {
      modules = new List<ModulesData>();
      json['modules'].forEach((v) {
        modules.add(new ModulesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner != null) {
      data['banner'] = this.banner.map((v) => v.toJson()).toList();
    }
    if (this.modules != null) {
      data['modules'] = this.modules.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerData {
  int bannerId;
  int ifAd;
  String bannerImg;
  int cartoonId;

  BannerData({this.bannerId, this.ifAd, this.bannerImg, this.cartoonId});

  BannerData.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    ifAd = json['if_ad'];
    bannerImg = json['banner_img'];
    cartoonId = json['cartoon_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_id'] = this.bannerId;
    data['if_ad'] = this.ifAd;
    data['banner_img'] = this.bannerImg;
    data['cartoon_id'] = this.cartoonId;
    return data;
  }
}

class ModulesData {
  int moduleId;
  int styleType;
  String moduleName;
  String moduleInfo;
  String moduleIcon;
  List<Cartoons> cartoons;
  int pointId;
  int currentPage;
  int totalPage;
  List<ExtraCartoon> extraCartoon;

  ModulesData(
      {this.moduleId,
      this.styleType,
      this.moduleName,
      this.moduleInfo,
      this.moduleIcon,
      this.cartoons,
      this.pointId,
      this.currentPage,
      this.totalPage,
      this.extraCartoon});

  ModulesData.fromJson(Map<String, dynamic> json) {
    moduleId = json['module_id'];
    styleType = json['style_type'];
    moduleName = json['module_name'];
    moduleInfo = json['module_info'];
    moduleIcon = json['module_icon'];
    if (json['cartoons'] != null) {
      cartoons = new List<Cartoons>();
      json['cartoons'].forEach((v) {
        cartoons.add(new Cartoons.fromJson(v));
      });
    }
    pointId = json['point_id'];
    currentPage = json['current_page'];
    totalPage = json['total_page'];
    if (json['extra_cartoon'] != null) {
      extraCartoon = new List<ExtraCartoon>();
      json['extra_cartoon'].forEach((v) {
        extraCartoon.add(new ExtraCartoon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['module_id'] = this.moduleId;
    data['style_type'] = this.styleType;
    data['module_name'] = this.moduleName;
    data['module_info'] = this.moduleInfo;
    data['module_icon'] = this.moduleIcon;
    if (this.cartoons != null) {
      data['cartoons'] = this.cartoons.map((v) => v.toJson()).toList();
    }
    data['point_id'] = this.pointId;
    data['current_page'] = this.currentPage;
    data['total_page'] = this.totalPage;
    if (this.extraCartoon != null) {
      data['extra_cartoon'] = this.extraCartoon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cartoons {
  int id;
  int tjType;
  String cartoonName;
  Author author;
  int ifFinish;
  String coverImg;
  int totalChapter;
  String lastView;
  String lastChapterNum;
  int ifUpdate;
  int lock;
  String category;
  String description;
  String popularity;
  int ifTop;
  String top;

  Cartoons(
      {this.id,
      this.tjType,
      this.cartoonName,
      this.author,
      this.ifFinish,
      this.coverImg,
      this.totalChapter,
      this.lastView,
      this.lastChapterNum,
      this.ifUpdate,
      this.lock,
      this.category,
      this.description,
      this.popularity,
      this.ifTop,
      this.top});

  Cartoons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tjType = json['tj_type'];
    cartoonName = json['cartoon_name'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    ifFinish = json['if_finish'];
    coverImg = json['cover_img'];
    totalChapter = json['total_chapter'];
    lastView = json['last_view'];
    lastChapterNum = json['last_chapter_num'];
    ifUpdate = json['if_update'];
    lock = json['lock'];
    category = json['category'];
    description = json['description'];
    popularity = json['popularity'];
    ifTop = json['if_top'];
    top = json['top'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tj_type'] = this.tjType;
    data['cartoon_name'] = this.cartoonName;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['if_finish'] = this.ifFinish;
    data['cover_img'] = this.coverImg;
    data['total_chapter'] = this.totalChapter;
    data['last_view'] = this.lastView;
    data['last_chapter_num'] = this.lastChapterNum;
    data['if_update'] = this.ifUpdate;
    data['lock'] = this.lock;
    data['category'] = this.category;
    data['description'] = this.description;
    data['popularity'] = this.popularity;
    data['if_top'] = this.ifTop;
    data['top'] = this.top;
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

class ExtraCartoon {
  int id;
  String cartoonName;
  Author author;
  int ifFinish;
  String coverImg;
  int totalChapter;
  String category;
  String description;
  String popularity;
  int ifTop;
  String top;

  ExtraCartoon(
      {this.id,
      this.cartoonName,
      this.author,
      this.ifFinish,
      this.coverImg,
      this.totalChapter,
      this.category,
      this.description,
      this.popularity,
      this.ifTop,
      this.top});

  ExtraCartoon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartoonName = json['cartoon_name'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    ifFinish = json['if_finish'];
    coverImg = json['cover_img'];
    totalChapter = json['total_chapter'];
    category = json['category'];
    description = json['description'];
    popularity = json['popularity'];
    ifTop = json['if_top'];
    top = json['top'];
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
    data['category'] = this.category;
    data['description'] = this.description;
    data['popularity'] = this.popularity;
    data['if_top'] = this.ifTop;
    data['top'] = this.top;
    return data;
  }
}
