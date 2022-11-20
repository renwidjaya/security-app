
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
