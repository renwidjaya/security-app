class Activities {
  Activities(
      {required this.user_id,
      required this.title,
      required this.description,
      required this.location,
      required this.latitude,
      required this.longitude,
      required this.is_published,
      required this.created_by});

  String user_id;
  String title;
  String description;
  String location;
  double latitude;
  double longitude;
  String is_published;
  String created_by;

  factory Activities.fromJson(Map<String, dynamic> json) => Activities(
        user_id: json["user_id"],
        title: json["title"],
        description: json["description"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        is_published: json["is_published"],
        created_by: json["created_by"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "title": title,
        "description": description,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "is_published": is_published,
        "created_by": created_by,
      };
}
