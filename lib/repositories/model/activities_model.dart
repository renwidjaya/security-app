class Activities {
  Activities({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<Activity> data;

  factory Activities.fromJson(Map<String, dynamic> json) => Activities(
    code: json["code"],
    message: json["message"],
    data: List<Activity>.from(json["data"].map((x) => Activity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Activity {
  Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.isPublished,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.likesCount,
    required this.commentsCount,
    required this.user,
  });

  int id;
  String title;
  String description;
  String image;
  String location;
  String latitude;
  String longitude;
  String isPublished;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int likesCount;
  int commentsCount;
  User user;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    location: json["location"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    isPublished: json["is_published"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    likesCount: int.parse(json["likes_count"]),
    commentsCount: int.parse(json["comments_count"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
    "location": location,
    "latitude": latitude,
    "longitude": longitude,
    "is_published": isPublished,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "likes_count": likesCount,
    "comments_count": commentsCount,
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