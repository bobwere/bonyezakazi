// To parse this JSON data, do
//
//     final spInProgressJobs = spInProgressJobsFromJson(jsonString);

import 'dart:convert';

SpInProgressJobs spInProgressJobsFromJson(String str) =>
    SpInProgressJobs.fromJson(json.decode(str));

String spInProgressJobsToJson(SpInProgressJobs data) =>
    json.encode(data.toJson());

class SpInProgressJobs {
  SpInProgressJobs({
    this.inProgressJobs,
    this.noJobsInProgress,
  });

  List<InProgressJob> inProgressJobs;
  int noJobsInProgress;

  SpInProgressJobs copyWith({
    List<InProgressJob> inProgressJobs,
    int noJobsInProgress,
  }) =>
      SpInProgressJobs(
        inProgressJobs: inProgressJobs ?? this.inProgressJobs,
        noJobsInProgress: noJobsInProgress ?? this.noJobsInProgress,
      );

  factory SpInProgressJobs.fromJson(Map<String, dynamic> json) =>
      SpInProgressJobs(
        inProgressJobs: json["inProgressJobs"] == null
            ? null
            : List<InProgressJob>.from(
                json["inProgressJobs"].map((x) => InProgressJob.fromJson(x))),
        noJobsInProgress:
            json["noJobsInProgress"] == null ? null : json["noJobsInProgress"],
      );

  Map<String, dynamic> toJson() => {
        "inProgressJobs": inProgressJobs == null
            ? null
            : List<dynamic>.from(inProgressJobs.map((x) => x.toJson())),
        "noJobsInProgress": noJobsInProgress == null ? null : noJobsInProgress,
      };
}

class InProgressJob {
  InProgressJob({
    this.id,
    this.workTitle,
    this.description,
    this.location,
    this.comments,
    this.bookingDate,
    this.bookingTime,
    this.workDuration,
    this.status,
    this.agreedPrice,
    this.workTodoImages,
    this.workDoneImages,
    this.clientId,
    this.workerId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String workTitle;
  dynamic description;
  String location;
  dynamic comments;
  DateTime bookingDate;
  String bookingTime;
  dynamic workDuration;
  String status;
  dynamic agreedPrice;
  dynamic workTodoImages;
  dynamic workDoneImages;
  String clientId;
  String workerId;
  DateTime createdAt;
  DateTime updatedAt;

  InProgressJob copyWith({
    int id,
    String workTitle,
    dynamic description,
    String location,
    dynamic comments,
    DateTime bookingDate,
    String bookingTime,
    dynamic workDuration,
    String status,
    dynamic agreedPrice,
    dynamic workTodoImages,
    dynamic workDoneImages,
    String clientId,
    String workerId,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      InProgressJob(
        id: id ?? this.id,
        workTitle: workTitle ?? this.workTitle,
        description: description ?? this.description,
        location: location ?? this.location,
        comments: comments ?? this.comments,
        bookingDate: bookingDate ?? this.bookingDate,
        bookingTime: bookingTime ?? this.bookingTime,
        workDuration: workDuration ?? this.workDuration,
        status: status ?? this.status,
        agreedPrice: agreedPrice ?? this.agreedPrice,
        workTodoImages: workTodoImages ?? this.workTodoImages,
        workDoneImages: workDoneImages ?? this.workDoneImages,
        clientId: clientId ?? this.clientId,
        workerId: workerId ?? this.workerId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory InProgressJob.fromJson(Map<String, dynamic> json) => InProgressJob(
        id: json["id"] == null ? null : json["id"],
        workTitle: json["work_title"] == null ? null : json["work_title"],
        description: json["description"],
        location: json["location"] == null ? null : json["location"],
        comments: json["comments"],
        bookingDate: json["booking_date"] == null
            ? null
            : DateTime.parse(json["booking_date"]),
        bookingTime: json["booking_time"] == null ? null : json["booking_time"],
        workDuration: json["work_duration"],
        status: json["status"] == null ? null : json["status"],
        agreedPrice: json["agreed_price"],
        workTodoImages: json["work_todo_images"],
        workDoneImages: json["work_done_images"],
        clientId: json["client_id"] == null ? null : json["client_id"],
        workerId: json["worker_id"] == null ? null : json["worker_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "work_title": workTitle == null ? null : workTitle,
        "description": description,
        "location": location == null ? null : location,
        "comments": comments,
        "booking_date": bookingDate == null
            ? null
            : "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
        "booking_time": bookingTime == null ? null : bookingTime,
        "work_duration": workDuration,
        "status": status == null ? null : status,
        "agreed_price": agreedPrice,
        "work_todo_images": workTodoImages,
        "work_done_images": workDoneImages,
        "client_id": clientId == null ? null : clientId,
        "worker_id": workerId == null ? null : workerId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
