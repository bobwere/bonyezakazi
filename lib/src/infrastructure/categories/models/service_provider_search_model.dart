/*import 'dart:convert';

ServiceProviderSearchModel serviceProviderSearchModelFromJson(String str) =>
    ServiceProviderSearchModel.fromJson(json.decode(str));

String serviceProviderSearchModelToJson(ServiceProviderSearchModel data) =>
    json.encode(data.toJson());

class ServiceProviderSearchModel {
  ServiceProviderSearchModel({
    this.data,
  });

  List<ServiceProvider> data;

  factory ServiceProviderSearchModel.fromJson(Map<String, dynamic> json) =>
      ServiceProviderSearchModel(
        data: List<ServiceProvider>.from(
            json["data"].map((x) => ServiceProvider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ServiceProvider {
  ServiceProvider({
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
  dynamic workDetails;
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
  String rating;
  String verifiedPhone;
  String verifiedEmail;
  dynamic accessToken;
  AtedAt createdAt;
  AtedAt updatedAt;
  Relationships relationships;

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      ServiceProvider(
        type: json["type"],
        workDetails: json["work_details"],
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
        "work_details": workDetails,
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

  Data data;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.type,
    this.attributes,
  });

  String type;
  dynamic attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
*/
import 'dart:convert';

ServiceProviderSearchModel serviceProviderSearchModelFromJson(String str) =>
    ServiceProviderSearchModel.fromJson(json.decode(str));

String serviceProviderSearchModelToJson(ServiceProviderSearchModel data) =>
    json.encode(data.toJson());

class ServiceProviderSearchModel {
  ServiceProviderSearchModel({
    this.data,
  });

  List<ServiceProvider> data;

  ServiceProviderSearchModel copyWith({
    List<ServiceProvider> data,
  }) =>
      ServiceProviderSearchModel(
        data: data ?? this.data,
      );

  factory ServiceProviderSearchModel.fromJson(Map<String, dynamic> json) =>
      ServiceProviderSearchModel(
        data: json["data"] == null
            ? null
            : List<ServiceProvider>.from(
                json["data"].map((x) => ServiceProvider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ServiceProvider {
  ServiceProvider({
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
    this.distance,
    this.accessToken,
    this.createdAt,
    this.updatedAt,
    this.relationships,
  });

  String type;
  dynamic workDetails;
  String id;
  dynamic name;
  String username;
  String skills;
  dynamic purpose;
  String userTypeId;
  String msisdn;
  dynamic email;
  String photo;
  String images;
  String location;
  String city;
  String rating;
  String verifiedPhone;
  String verifiedEmail;
  int distance;
  dynamic accessToken;
  AtedAt createdAt;
  AtedAt updatedAt;
  Relationships relationships;

  ServiceProvider copyWith({
    String type,
    dynamic workDetails,
    String id,
    dynamic name,
    String username,
    String skills,
    dynamic purpose,
    String userTypeId,
    String msisdn,
    dynamic email,
    String photo,
    String images,
    String location,
    String city,
    String rating,
    String verifiedPhone,
    String verifiedEmail,
    int distance,
    dynamic accessToken,
    AtedAt createdAt,
    AtedAt updatedAt,
    Relationships relationships,
  }) =>
      ServiceProvider(
        type: type ?? this.type,
        workDetails: workDetails ?? this.workDetails,
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        skills: skills ?? this.skills,
        purpose: purpose ?? this.purpose,
        userTypeId: userTypeId ?? this.userTypeId,
        msisdn: msisdn ?? this.msisdn,
        email: email ?? this.email,
        photo: photo ?? this.photo,
        images: images ?? this.images,
        location: location ?? this.location,
        city: city ?? this.city,
        rating: rating ?? this.rating,
        verifiedPhone: verifiedPhone ?? this.verifiedPhone,
        verifiedEmail: verifiedEmail ?? this.verifiedEmail,
        distance: distance ?? this.distance,
        accessToken: accessToken ?? this.accessToken,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        relationships: relationships ?? this.relationships,
      );

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      ServiceProvider(
        type: json["type"] == null ? null : json["type"],
        workDetails: json["work_details"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
        username: json["username"] == null ? null : json["username"],
        skills: json["skills"] == null ? null : json["skills"],
        purpose: json["purpose"],
        userTypeId: json["user_type_id"] == null ? null : json["user_type_id"],
        msisdn: json["msisdn"] == null ? null : json["msisdn"],
        email: json["email"],
        photo: json["photo"] == null ? null : json["photo"],
        images: json["images"] == null ? null : json["images"],
        location: json["location"] == null ? null : json["location"],
        city: json["city"] == null ? null : json["city"],
        rating: json["rating"] == null ? null : json["rating"],
        verifiedPhone:
            json["verified_phone"] == null ? null : json["verified_phone"],
        verifiedEmail:
            json["verified_email"] == null ? null : json["verified_email"],
        distance: json["distance"] == null ? null : json["distance"],
        accessToken: json["access_token"],
        createdAt: json["created_at"] == null
            ? null
            : AtedAt.fromJson(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : AtedAt.fromJson(json["updated_at"]),
        relationships: json["relationships"] == null
            ? null
            : Relationships.fromJson(json["relationships"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "work_details": workDetails,
        "id": id == null ? null : id,
        "name": name,
        "username": username == null ? null : username,
        "skills": skills == null ? null : skills,
        "purpose": purpose,
        "user_type_id": userTypeId == null ? null : userTypeId,
        "msisdn": msisdn == null ? null : msisdn,
        "email": email,
        "photo": photo == null ? null : photo,
        "images": images == null ? null : images,
        "location": location == null ? null : location,
        "city": city == null ? null : city,
        "rating": rating == null ? null : rating,
        "verified_phone": verifiedPhone == null ? null : verifiedPhone,
        "verified_email": verifiedEmail == null ? null : verifiedEmail,
        "distance": distance == null ? null : distance,
        "access_token": accessToken,
        "created_at": createdAt == null ? null : createdAt.toJson(),
        "updated_at": updatedAt == null ? null : updatedAt.toJson(),
        "relationships": relationships == null ? null : relationships.toJson(),
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

  Relationships copyWith({
    Gender userType,
    Gender posts,
    Gender gender,
    Gender messages,
  }) =>
      Relationships(
        userType: userType ?? this.userType,
        posts: posts ?? this.posts,
        gender: gender ?? this.gender,
        messages: messages ?? this.messages,
      );

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
        userType:
            json["userType"] == null ? null : Gender.fromJson(json["userType"]),
        posts: json["posts"] == null ? null : Gender.fromJson(json["posts"]),
        gender: json["gender"] == null ? null : Gender.fromJson(json["gender"]),
        messages:
            json["messages"] == null ? null : Gender.fromJson(json["messages"]),
      );

  Map<String, dynamic> toJson() => {
        "userType": userType == null ? null : userType.toJson(),
        "posts": posts == null ? null : posts.toJson(),
        "gender": gender == null ? null : gender.toJson(),
        "messages": messages == null ? null : messages.toJson(),
      };
}

class Gender {
  Gender({
    this.data,
  });

  Data data;

  Gender copyWith({
    Data data,
  }) =>
      Gender(
        data: data ?? this.data,
      );

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.type,
    this.attributes,
  });

  String type;
  dynamic attributes;

  Data copyWith({
    String type,
    dynamic attributes,
  }) =>
      Data(
        type: type ?? this.type,
        attributes: attributes ?? this.attributes,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"] == null ? null : json["type"],
        attributes: json["attributes"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
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

  AttributesClass copyWith({
    int id,
    String name,
    String active,
  }) =>
      AttributesClass(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
      );

  factory AttributesClass.fromJson(Map<String, dynamic> json) =>
      AttributesClass(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "active": active == null ? null : active,
      };
}
