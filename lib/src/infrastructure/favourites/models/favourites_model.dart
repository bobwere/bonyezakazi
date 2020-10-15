import 'dart:convert';

Favourites favouritesFromJson(String str) =>
    Favourites.fromJson(json.decode(str));

String favouritesToJson(Favourites data) => json.encode(data.toJson());

class Favourites {
  Favourites({
    this.id,
    this.name,
    this.rating,
    this.skill,
    this.imageUrl,
    this.time,
    this.msisdn,
    this.images,
    this.location,
    this.city,
  });

  String id;
  String name;
  String skill;
  String rating;
  String imageUrl;
  String time;
  String msisdn;
  String images;
  String location;
  String city;

  factory Favourites.fromJson(Map<String, dynamic> json) => Favourites(
        id: json["id"],
        name: json["name"],
        skill: json["skill"],
        rating: json["rating"],
        imageUrl: json["imageUrl"],
        time: json["time"],
        msisdn: json["msisdn"],
        images: json["images"],
        location: json["location"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "skill": skill,
        "rating": rating,
        "imageUrl": imageUrl,
        "time": time,
        "msisdn": msisdn,
        "images": images,
        "location": location,
        "city": city,
      };
}
