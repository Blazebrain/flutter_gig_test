class NewsArticlesModel {
  Sources sources;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  String publishedAt;
  NewsArticlesModel({
    this.sources,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
    this.publishedAt,
  });

  NewsArticlesModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    content = json['content'];
    publishedAt = json['publishedAt'];
    sources =
        json['source'] != null ? new Sources.fromJson(json['source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['content'] = this.content;
    data['publishedAt'] = this.publishedAt;
    if (this.sources != null) {
      data['source'] = this.sources.toJson();
    }
    return data;
  }
}

class Sources {
  String name;
  String id;
  Sources({
    this.name,
    this.id,
  });

  Sources.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
