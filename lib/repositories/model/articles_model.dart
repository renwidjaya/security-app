// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Articles {
  Articles({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<Article> data;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        code: json["code"],
        message: json["message"],
        data: List<Article>.from(json["data"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  int id;
  String title;
  String description;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.nik,
    required this.satker,
    required this.role,
  });

  int id;
  String name;
  String username;
  String email;
  String nik;
  String satker;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        nik: json["nik"],
        satker: json["satker"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "nik": nik,
        "satker": satker,
        "role": role,
      };
}
