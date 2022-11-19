import 'dart:convert';

Satker satkerFromJson(String str) => Satker.fromJson(json.decode(str));

String satkerToJson(Satker data) => json.encode(data.toJson());

class Satkers {
  Satkers({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<Satker> data;

  factory Satkers.fromJson(Map<String, dynamic> json) => Satkers(
        code: json["code"],
        message: json["message"],
        data: List<Satker>.from(json["data"].map((x) => Satker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Satker {
  Satker({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  int id;
  String name;
  double latitude;
  double longitude;

  factory Satker.fromJson(Map<String, dynamic> json) => Satker(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
      };
}
