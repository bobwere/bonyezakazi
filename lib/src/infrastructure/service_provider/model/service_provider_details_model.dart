import 'dart:convert';

ServiceProviderDetailModel serviceProviderDetailModelFromJson(String str) =>
    ServiceProviderDetailModel.fromJson(json.decode(str));

String serviceProviderDetailModelToJson(ServiceProviderDetailModel data) =>
    json.encode(data.toJson());

class ServiceProviderDetailModel {
  ServiceProviderDetailModel({
    this.data,
  });

  ServiceProviderDetail data;

  factory ServiceProviderDetailModel.fromJson(Map<String, dynamic> json) =>
      ServiceProviderDetailModel(
        data: ServiceProviderDetail.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ServiceProviderDetail {
  ServiceProviderDetail({
    this.type,
    this.workDetails,
    this.id,
    this.name,
    this.username,
    this.skills,
    this.purpose,
    this.userTypeId,
    this.msisdn,
    this.email,
    this.photo,
    this.images,
    this.location,
    this.city,
    this.rating,
    this.verifiedPhone,
    this.verifiedEmail,
    this.accessToken,
    this.createdAt,
    this.updatedAt,
    this.relationships,
  });

  String type;
  List<WorkDetail> workDetails;
  String id;
  dynamic name;
  dynamic username;
  String skills;
  dynamic purpose;
  String userTypeId;
  String msisdn;
  dynamic email;
  String photo;
  String images;
  String location;
  String city;
  dynamic rating;
  String verifiedPhone;
  String verifiedEmail;
  dynamic accessToken;
  AtedAt createdAt;
  AtedAt updatedAt;
  Relationships relationships;

  factory ServiceProviderDetail.fromJson(Map<String, dynamic> json) =>
      ServiceProviderDetail(
        type: json["type"],
        workDetails: List<WorkDetail>.from(
            json["work_details"].map((x) => WorkDetail.fromJson(x))),
        id: json["id"],
        name: json["name"],
        username: json["username"],
        skills: json["skills"],
        purpose: json["purpose"],
        userTypeId: json["user_type_id"],
        msisdn: json["msisdn"],
        email: json["email"],
        photo: json["photo"],
        images: json["images"],
        location: json["location"],
        city: json["city"],
        rating: json["rating"],
        verifiedPhone: json["verified_phone"],
        verifiedEmail: json["verified_email"],
        accessToken: json["access_token"],
        createdAt: AtedAt.fromJson(json["created_at"]),
        updatedAt: AtedAt.fromJson(json["updated_at"]),
        relationships: Relationships.fromJson(json["relationships"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "work_details": List<dynamic>.from(workDetails.map((x) => x.toJson())),
        "id": id,
        "name": name,
        "skills": skills,
        "username": username,
        "purpose": purpose,
        "user_type_id": userTypeId,
        "msisdn": msisdn,
        "email": email,
        "photo": photo,
        "images": images,
        "location": location,
        "city": city,
        "rating": rating,
        "verified_phone": verifiedPhone,
        "verified_email": verifiedEmail,
        "access_token": accessToken,
        "created_at": createdAt.toJson(),
        "updated_at": updatedAt.toJson(),
        "relationships": relationships.toJson(),
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

  factory AtedAt.fromJson(Map<String, dynamic> json) => AtedAt(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}

class Relationships {
  Relationships({
    this.userType,
    this.posts,
    this.gender,
    this.messages,
  });

  Gender userType;
  Gender posts;
  Gender gender;
  Gender messages;

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
        userType: Gender.fromJson(json["userType"]),
        posts: Gender.fromJson(json["posts"]),
        gender: Gender.fromJson(json["gender"]),
        messages: Gender.fromJson(json["messages"]),
      );

  Map<String, dynamic> toJson() => {
        "userType": userType.toJson(),
        "posts": posts.toJson(),
        "gender": gender.toJson(),
        "messages": messages.toJson(),
      };
}

class Gender {
  Gender({
    this.data,
  });

  GenderData data;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        data: GenderData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class GenderData {
  GenderData({
    this.type,
    this.attributes,
  });

  String type;
  dynamic attributes;

  factory GenderData.fromJson(Map<String, dynamic> json) => GenderData(
        type: json["type"],
        attributes: json["attributes"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "attributes": attributes,
      };
}

class AttributesClass {
  AttributesClass({
    this.id,
    this.name,
    this.active,
  });

  int id;
  String name;
  String active;

  factory AttributesClass.fromJson(Map<String, dynamic> json) =>
      AttributesClass(
        id: json["id"],
        name: json["name"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
      };
}

class WorkDetail {
  WorkDetail({
    this.id,
    this.workTitle,
    this.description,
    this.comments,
    this.workTodoImages,
    this.workDoneImages,
    this.rating,
  });

  int id;
  String workTitle;
  dynamic description;
  dynamic comments;
  dynamic workTodoImages;
  dynamic workDoneImages;
  dynamic rating;

  factory WorkDetail.fromJson(Map<String, dynamic> json) => WorkDetail(
        id: json["id"],
        workTitle: json["work_title"],
        description: json["description"],
        comments: json["comments"],
        workTodoImages: json["work_todo_images"],
        workDoneImages: json["work_done_images"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "work_title": workTitle,
        "description": description,
        "comments": comments,
        "work_todo_images": workTodoImages,
        "work_done_images": workDoneImages,
        "rating": rating,
      };
}
