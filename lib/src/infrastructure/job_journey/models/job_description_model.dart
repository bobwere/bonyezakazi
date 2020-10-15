import 'dart:convert';

JobDescriptionModel jobDescriptionModelFromJson(String str) =>
    JobDescriptionModel.fromJson(json.decode(str));

String jobDescriptionModelToJson(JobDescriptionModel data) =>
    json.encode(data.toJson());

class JobDescriptionModel {
  JobDescriptionModel({
    this.data,
  });

  JobDescription data;

  JobDescriptionModel copyWith({
    JobDescription data,
  }) =>
      JobDescriptionModel(
        data: data ?? this.data,
      );

  factory JobDescriptionModel.fromJson(Map<String, dynamic> json) =>
      JobDescriptionModel(
        data:
            json["data"] == null ? null : JobDescription.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
      };
}

class JobDescription {
  JobDescription({
    this.type,
    this.id,
    this.workTitle,
    this.location,
    this.clientId,
    this.workerId,
    this.bookingDate,
    this.bookingTime,
    this.workDuration,
    this.status,
    this.agreedPrice,
    this.workTodoImages,
    this.workDoneImages,
    this.relationships,
  });

  String type;
  String id;
  String workTitle;
  String location;
  String clientId;
  String workerId;
  String bookingDate;
  String bookingTime;
  dynamic workDuration;
  String status;
  String agreedPrice;
  List<String> workTodoImages;
  dynamic workDoneImages;
  List<dynamic> relationships;

  JobDescription copyWith({
    String type,
    String id,
    String workTitle,
    String location,
    String clientId,
    String workerId,
    String bookingDate,
    String bookingTime,
    dynamic workDuration,
    String status,
    String agreedPrice,
    List<String> workTodoImages,
    dynamic workDoneImages,
    List<dynamic> relationships,
  }) =>
      JobDescription(
        type: type ?? this.type,
        id: id ?? this.id,
        workTitle: workTitle ?? this.workTitle,
        location: location ?? this.location,
        clientId: clientId ?? this.clientId,
        workerId: workerId ?? this.workerId,
        bookingDate: bookingDate ?? this.bookingDate,
        bookingTime: bookingTime ?? this.bookingTime,
        workDuration: workDuration ?? this.workDuration,
        status: status ?? this.status,
        agreedPrice: agreedPrice ?? this.agreedPrice,
        workTodoImages: workTodoImages ?? this.workTodoImages,
        workDoneImages: workDoneImages ?? this.workDoneImages,
        relationships: relationships ?? this.relationships,
      );

  factory JobDescription.fromJson(Map<String, dynamic> json) => JobDescription(
        type: json["type"] == null ? null : json["type"],
        id: json["id"] == null ? null : json["id"],
        workTitle: json["work_title"] == null ? null : json["work_title"],
        location: json["location"] == null ? null : json["location"],
        clientId: json["client_id"] == null ? null : json["client_id"],
        workerId: json["worker_id"] == null ? null : json["worker_id"],
        bookingDate: json["booking_date"] == null ? null : json["booking_date"],
        bookingTime: json["booking_time"] == null ? null : json["booking_time"],
        workDuration: json["work_duration"],
        status: json["status"] == null ? null : json["status"],
        agreedPrice: json["agreed_price"] == null ? null : json["agreed_price"],
        workTodoImages: json["work_todo_images"] == null
            ? null
            : List<String>.from(json["work_todo_images"].map((x) => x)),
        workDoneImages: json["work_done_images"],
        relationships: json["relationships"] == null
            ? null
            : List<dynamic>.from(json["relationships"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "id": id == null ? null : id,
        "work_title": workTitle == null ? null : workTitle,
        "location": location == null ? null : location,
        "client_id": clientId == null ? null : clientId,
        "worker_id": workerId == null ? null : workerId,
        "booking_date": bookingDate == null ? null : bookingDate,
        "booking_time": bookingTime == null ? null : bookingTime,
        "work_duration": workDuration,
        "status": status == null ? null : status,
        "agreed_price": agreedPrice == null ? null : agreedPrice,
        "work_todo_images": workTodoImages == null
            ? null
            : List<dynamic>.from(workTodoImages.map((x) => x)),
        "work_done_images": workDoneImages,
        "relationships": relationships == null
            ? null
            : List<dynamic>.from(relationships.map((x) => x)),
      };
}
