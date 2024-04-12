import 'dart:convert';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  String title;
  String body;
  String photo;
  int idCategory;
  String id;

  News({
    required this.title,
    required this.body,
    required this.photo,
    required this.idCategory,
    required this.id,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        title: json["title"],
        body: json["body"],
        photo: json["photo"],
        idCategory: json["id_category"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "photo": photo,
        "id_category": idCategory,
        "id": id,
      };
}
