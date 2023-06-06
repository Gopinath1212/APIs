class Hidocc {
  int? success;
  String? message;
  Data? data;
  String? timestamp;

  Hidocc({this.success, this.message, this.data, this.timestamp});

  Hidocc.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Data {
  List<News>? news;
  List<TrandingBulletin>? trandingBulletin;
  String? specialityName;
  List<Null>? latestArticle;
  List<ExploreArticle>? exploreArticle;
  List<TrandingBulletin>? trandingArticle;
  Article? article;
  //List<Bulletin>? bulletin;
  int? sId;

  Data(
      {this.news,
        this.trandingBulletin,
        this.specialityName,
        this.latestArticle,
        this.exploreArticle,
        this.trandingArticle,
        this.article,
      //  this.bulletin,
        this.sId});

  Data. fromJson(Map<String, dynamic> json) {
    //print("cccc");
    //n print(json);
    // if (json['news'] != null) {
    //   news = <News>[];
    //   json['news'].forEach((v) {
    //     news!.add(new News.fromJson(v));
    //   });
    // }
    if (json['trandingBulletin'] != null) {
      trandingBulletin = <TrandingBulletin>[];
      json['trandingBulletin'].forEach((v) {
        trandingBulletin!.add(new TrandingBulletin.fromJson(v));
      });
    }
    specialityName = json['specialityName'];
    // if (json['latestArticle'] != null) {
    //   latestArticle = <Null>[];
    //   json['latestArticle'].forEach((v) {
    //     latestArticle!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['exploreArticle'] != null) {
    //   exploreArticle = <ExploreArticle>[];
    //   json['exploreArticle'].forEach((v) {
    //     exploreArticle!.add(new ExploreArticle.fromJson(v));
    //   });
    // }
    // if (json['trandingArticle'] != null) {
    //   trandingArticle = <TrandingBulletin>[];
    //   json['trandingArticle'].forEach((v) {
    //     trandingArticle!.add(new TrandingBulletin().fromJson(v));
    //   });
    // }
    article =
    json['article'] != null ? new Article.fromJson(json['article']) : null;
    // if (json['bulletin'] != null) {
    //   bulletin = <Bulletin>[];
    //   json['bulletin'].forEach((v) {
    //     bulletin!.add(new Bulletin.fromJson(v));
    //   });
    // }
    sId = json['sId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    if (this.trandingBulletin != null) {
      data['trandingBulletin'] =
          this.trandingBulletin!.map((v) => v.toJson()).toList();
    }
    data['specialityName'] = this.specialityName;

    if (this.exploreArticle != null) {
      data['exploreArticle'] =
          this.exploreArticle!.map((v) => v.toJson()).toList();
    }
    if (this.trandingArticle != null) {
      data['trandingArticle'] =
          this.trandingArticle!.map((v) => v.toJson()).toList();
    }
    if (this.article != null) {
      data['article'] = this.article!.toJson();
    }

    data['sId'] = this.sId;
    return data;
  }
}

class News {
  int? id;
  String? title;
  String? url;
  String? urlToImage;
  String? description;
  String? speciality;
  String? newsUniqueId;
  int? trendingLatest;
  String? publishedAt;

  News(
      {this.id,
        this.title,
        this.url,
        this.urlToImage,
        this.description,
        this.speciality,
        this.newsUniqueId,
        this.trendingLatest,
        this.publishedAt});

  News.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    title = json['title'].toString();
    url = json['url'].toString();
    urlToImage = json['urlToImage'].toString();
    description = json['description'].toString();
    speciality = json['speciality'].toString();
    newsUniqueId = json['newsUniqueId'].toString();
    trendingLatest = int.parse(json['trendingLatest'].toString());
    publishedAt = json['publishedAt'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['description'] = this.description;
    data['speciality'] = this.speciality;
    data['newsUniqueId'] = this.newsUniqueId;
    data['trendingLatest'] = this.trendingLatest;
    data['publishedAt'] = this.publishedAt;
    return data;
  }
}

class TrandingBulletin {
  int? id;
  String? articleTitle;
  String? redirectLink;
  String? articleImg;
  String? articleDescription;
  int? specialityId;
  int? rewardPoints;


  TrandingBulletin(
      {this.id,
        this.articleTitle,
        this.redirectLink,
        this.articleImg,
        this.articleDescription,
        this.specialityId,
        this.rewardPoints,
       });

  TrandingBulletin.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    articleTitle = json['articleTitle'].toString();
    redirectLink = json['redirectLink'].toString();
    articleImg = json['articleImg'].toString();
    articleDescription = json['articleDescription'].toString();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleTitle'] = this.articleTitle;
    data['redirectLink'] = this.redirectLink;
    data['articleImg'] = this.articleImg;
    data['articleDescription'] = this.articleDescription;
    data['specialityId'] = this.specialityId;
    data['rewardPoints'] = this.rewardPoints;

    return data;
  }
}

class ExploreArticle {
  int? id;
  String? articleTitle;
  String? redirectLink;
  String? articleImg;
  String? articleDescription;
  String? specialityId;
  int? rewardPoints;
  String? keywordsList;
  String? articleUniqueId;
  int? articleType;
  String? createdAt;

  ExploreArticle(
      {this.id,
        this.articleTitle,
        this.redirectLink,
        this.articleImg,
        this.articleDescription,
        this.specialityId,
        this.rewardPoints,
        this.keywordsList,
        this.articleUniqueId,
        this.articleType,
        this.createdAt});

  ExploreArticle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleTitle = json['articleTitle'];
    redirectLink = json['redirectLink'];
    articleImg = json['articleImg'];
    articleDescription = json['articleDescription'];
    specialityId = json['specialityId'];
    rewardPoints = json['rewardPoints'];
    keywordsList = json['keywordsList'];
    articleUniqueId = json['articleUniqueId'];
    articleType = json['articleType'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleTitle'] = this.articleTitle;
    data['redirectLink'] = this.redirectLink;
    data['articleImg'] = this.articleImg;
    data['articleDescription'] = this.articleDescription;
    data['specialityId'] = this.specialityId;
    data['rewardPoints'] = this.rewardPoints;
    data['keywordsList'] = this.keywordsList;
    data['articleUniqueId'] = this.articleUniqueId;
    data['articleType'] = this.articleType;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Article {
  int? id;
  String? articleTitle;
  String? redirectLink;
  String? articleImg;
  String? articleDescription;
  String? specialityId;
  int? rewardPoints;
  String? keywordsList;
  Null? articleUniqueId;
  int? articleType;
  String? createdAt;

  Article(
      {this.id,
        this.articleTitle,
        this.redirectLink,
        this.articleImg,
        this.articleDescription,
        this.specialityId,
        this.rewardPoints,
        this.keywordsList,
        this.articleUniqueId,
        this.articleType,
        this.createdAt});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleTitle = json['articleTitle'];
    redirectLink = json['redirectLink'];
    articleImg = json['articleImg'];
    articleDescription = json['articleDescription'];
    specialityId = json['specialityId'];
    rewardPoints = json['rewardPoints'];
    keywordsList = json['keywordsList'];
    articleUniqueId = json['articleUniqueId'];
    articleType = json['articleType'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleTitle'] = this.articleTitle;
    data['redirectLink'] = this.redirectLink;
    data['articleImg'] = this.articleImg;
    data['articleDescription'] = this.articleDescription;
    data['specialityId'] = this.specialityId;
    data['rewardPoints'] = this.rewardPoints;
    data['keywordsList'] = this.keywordsList;
    data['articleUniqueId'] = this.articleUniqueId;
    data['articleType'] = this.articleType;
    data['createdAt'] = this.createdAt;
    return data;
  }
}