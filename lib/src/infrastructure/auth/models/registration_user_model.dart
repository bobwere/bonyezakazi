// To parse this JSON data, do
//
//     final registrationUserModel = registrationUserModelFromJson(jsonString);

import 'dart:convert';

RegistrationUserModel registrationUserModelFromJson(String str) =>
    RegistrationUserModel.fromJson(json.decode(str));

String registrationUserModelToJson(RegistrationUserModel data) =>
    json.encode(data.toJson());

class RegistrationUserModel {
  RegistrationUserModel({
    this.message,
    this.user,
  });

  String message;
  User user;

  RegistrationUserModel copyWith({
    String message,
    User user,
  }) =>
      RegistrationUserModel(
        message: message ?? this.message,
        user: user ?? this.user,
      );

  factory RegistrationUserModel.fromJson(Map<String, dynamic> json) =>
      RegistrationUserModel(
        message: json["message"] == null ? null : json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "user": user == null ? null : user.toJson(),
      };
}

class User {
  User({
    this.username,
    this.userTypeId,
    this.skills,
    this.city,
    this.location,
    this.msisdn,
    this.photo,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.emailToken,
    this.phoneToken,
    this.images,
    this.accessToken,
    this.createdAtTa,
  });

  String username;
  String userTypeId;
  String skills;
  String city;
  String location;
  String msisdn;
  String photo;
  AtedAt updatedAt;
  AtedAt createdAt;
  int id;
  String emailToken;
  int phoneToken;
  List<dynamic> images;
  String accessToken;
  String createdAtTa;

  User copyWith({
    String username,
    String userTypeId,
    String skills,
    String city,
    String location,
    String msisdn,
    String photo,
    AtedAt updatedAt,
    AtedAt createdAt,
    int id,
    String emailToken,
    int phoneToken,
    List<dynamic> images,
    String accessToken,
    String createdAtTa,
  }) =>
      User(
        username: username ?? this.username,
        userTypeId: userTypeId ?? this.userTypeId,
        skills: skills ?? this.skills,
        city: city ?? this.city,
        location: location ?? this.location,
        msisdn: msisdn ?? this.msisdn,
        photo: photo ?? this.photo,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        emailToken: emailToken ?? this.emailToken,
        phoneToken: phoneToken ?? this.phoneToken,
        images: images ?? this.images,
        accessToken: accessToken ?? this.accessToken,
        createdAtTa: createdAtTa ?? this.createdAtTa,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"] == null ? null : json["username"],
        userTypeId: json["user_type_id"] == null ? null : json["user_type_id"],
        skills: json["skills"] == null ? null : json["skills"],
        city: json["city"] == null ? null : json["city"],
        location: json["location"] == null ? null : json["location"],
        msisdn: json["msisdn"] == null ? null : json["msisdn"],
        photo: json["photo"] == null ? null : json["photo"],
        updatedAt: json["updated_at"] == null
            ? null
            : AtedAt.fromJson(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : AtedAt.fromJson(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
        emailToken: json["email_token"] == null ? null : json["email_token"],
        phoneToken: json["phone_token"] == null ? null : json["phone_token"],
        images: json["images"] == null
            ? null
            : List<dynamic>.from(json["images"].map((x) => x)),
        accessToken: json["access_token"] == null ? null : json["access_token"],
        createdAtTa:
            json["created_at_ta"] == null ? null : json["created_at_ta"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "user_type_id": userTypeId == null ? null : userTypeId,
        "skills": skills == null ? null : skills,
        "city": city == null ? null : city,
        "location": location == null ? null : location,
        "msisdn": msisdn == null ? null : msisdn,
        "photo": photo == null ? null : photo,
        "updated_at": updatedAt == null ? null : updatedAt.toJson(),
        "created_at": createdAt == null ? null : createdAt.toJson(),
        "id": id == null ? null : id,
        "email_token": emailToken == null ? null : emailToken,
        "phone_token": phoneToken == null ? null : phoneToken,
        "images":
            images == null ? null : List<dynamic>.from(images.map((x) => x)),
        "access_token": accessToken == null ? null : accessToken,
        "created_at_ta": createdAtTa == null ? null : createdAtTa,
      };
}

class AtedAt {
  AtedAt({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  AtedAt copyWith({
    DateTime date,
    int timezoneType,
    String timezone,
  }) =>
      AtedAt(
        date: date ?? this.date,
        timezoneType: timezoneType ?? this.timezoneType,
        timezone: timezone ?? this.timezone,
      );

  factory AtedAt.fromJson(Map<String, dynamic> json) => AtedAt(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        timezoneType:
            json["timezone_type"] == null ? null : json["timezone_type"],
        timezone: json["timezone"] == null ? null : json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null ? null : date.toIso8601String(),
        "timezone_type": timezoneType == null ? null : timezoneType,
        "timezone": timezone == null ? null : timezone,
      };
}
