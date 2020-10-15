import 'dart:convert';

CasualCategoriesModel casualCategoriesModelFromJson(String str) =>
    CasualCategoriesModel.fromJson(json.decode(str));

String casualCategoriesModelToJson(CasualCategoriesModel data) =>
    json.encode(data.toJson());

class CasualCategoriesModel {
  CasualCategoriesModel({
    this.data,
    this.links,
    this.meta,
  });

  List<Categories> data;
  Links links;
  Meta meta;

  factory CasualCategoriesModel.fromJson(Map<String, dynamic> json) =>
      CasualCategoriesModel(
        data: List<Categories>.from(
            json["data"].map((x) => Categories.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Categories {
  Categories({
    this.type,
    this.id,
    this.name,
    this.relationships,
  });

  DatumType type;
  String id;
  String name;
  Relationships relationships;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        type: datumTypeValues.map[json["type"]],
        id: json["id"],
        name: json["name"],
        relationships: Relationships.fromJson(json["relationships"]),
      );

  Map<String, dynamic> toJson() => {
        "type": datumTypeValues.reverse[type],
        "id": id,
        "name": name,
        "relationships": relationships.toJson(),
      };
}

class Relationships {
  Relationships({
    this.casualCategoryParent,
  });

  CasualCategoryParent casualCategoryParent;

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
        casualCategoryParent:
            CasualCategoryParent.fromJson(json["casualCategoryParent"]),
      );

  Map<String, dynamic> toJson() => {
        "casualCategoryParent": casualCategoryParent.toJson(),
      };
}

class CasualCategoryParent {
  CasualCategoryParent({
    this.type,
    this.attributes,
  });

  CasualCategoryParentType type;
  dynamic attributes;

  factory CasualCategoryParent.fromJson(Map<String, dynamic> json) =>
      CasualCategoryParent(
        type: casualCategoryParentTypeValues.map[json["type"]],
        attributes: json["attributes"],
      );

  Map<String, dynamic> toJson() => {
        "type": casualCategoryParentTypeValues.reverse[type],
        "attributes": attributes,
      };
}

enum CasualCategoryParentType { CAUSAL_CATEGORY_PARENT }

final casualCategoryParentTypeValues = EnumValues(
    {"causalCategoryParent": CasualCategoryParentType.CAUSAL_CATEGORY_PARENT});

enum DatumType { CASUAL_CATEGORY }

final datumTypeValues =
    EnumValues({"casualCategory": DatumType.CASUAL_CATEGORY});

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
