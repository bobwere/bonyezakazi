// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

Notifications notificationsFromJson(String str) =>
    Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  Notifications({
    this.inboxmessages,
    this.jobrequestmessages,
    this.jobcompletedmessages,
    this.leaveareviewmessages,
    this.bookingconfirmedmessages,
    this.bookingdeclinedmessages,
  });

  bool inboxmessages;
  bool jobrequestmessages;
  bool jobcompletedmessages;
  bool leaveareviewmessages;
  bool bookingconfirmedmessages;
  bool bookingdeclinedmessages;

  Notifications copyWith({
    bool inboxmessages,
    bool jobrequestmessages,
    bool jobcompletedmessages,
    bool leaveareviewmessages,
    bool bookingconfirmedmessages,
    bool bookingdeclinedmessages,
  }) =>
      Notifications(
        inboxmessages: inboxmessages ?? this.inboxmessages,
        jobrequestmessages: jobrequestmessages ?? this.jobrequestmessages,
        jobcompletedmessages: jobcompletedmessages ?? this.jobcompletedmessages,
        leaveareviewmessages: leaveareviewmessages ?? this.leaveareviewmessages,
        bookingconfirmedmessages:
            bookingconfirmedmessages ?? this.bookingconfirmedmessages,
        bookingdeclinedmessages:
            bookingdeclinedmessages ?? this.bookingdeclinedmessages,
      );

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        inboxmessages:
            json["inboxmessages"] == null ? null : json["inboxmessages"],
        jobrequestmessages: json["jobrequestmessages"] == null
            ? null
            : json["jobrequestmessages"],
        jobcompletedmessages: json["jobcompletedmessages"] == null
            ? null
            : json["jobcompletedmessages"],
        leaveareviewmessages: json["leaveareviewmessages"] == null
            ? null
            : json["leaveareviewmessages"],
        bookingconfirmedmessages: json["bookingconfirmedmessages"] == null
            ? null
            : json["bookingconfirmedmessages"],
        bookingdeclinedmessages: json["bookingdeclinedmessages"] == null
            ? null
            : json["bookingdeclinedmessages"],
      );

  Map<String, dynamic> toJson() => {
        "inboxmessages": inboxmessages == null ? null : inboxmessages,
        "jobrequestmessages":
            jobrequestmessages == null ? null : jobrequestmessages,
        "jobcompletedmessages":
            jobcompletedmessages == null ? null : jobcompletedmessages,
        "leaveareviewmessages":
            leaveareviewmessages == null ? null : leaveareviewmessages,
        "bookingconfirmedmessages":
            bookingconfirmedmessages == null ? null : bookingconfirmedmessages,
        "bookingdeclinedmessages":
            bookingdeclinedmessages == null ? null : bookingdeclinedmessages,
      };
}
