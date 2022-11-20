// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

LoginModel loginFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.code,
    required this.message,
    required this.data,
    required this.token,
  });

  int code;
  String message;
  DataLogin data;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        message: json["message"],
        data: DataLogin.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
        "token": token,
      };
}

class DataLogin {
  DataLogin({
    required this.id,
    required this.name,
    required this.position,
    required this.rank,
    required this.nik,
    required this.phone,
    required this.satkerId,
    required this.level,
    required this.createdBy,
    required this.updatedBy,
    required this.isActive,
    required this.deletedAt,
  });

  int id;
  String name;
  dynamic position;
  dynamic rank;
  dynamic nik;
  dynamic phone;
  dynamic satkerId;
  dynamic level;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic isActive;
  dynamic deletedAt;

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        rank: json["rank"],
        nik: json["nik"],
        phone: json["phone"],
        satkerId: json["satker_id"],
        level: json["level"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        isActive: json["is_active"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "rank": rank,
        "nik": nik,
        "phone": phone,
        "satker_id": satkerId,
        "level": level,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "is_active": isActive,
        "deleted_at": deletedAt,
      };
}
