import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    this.id,
    this.sender,
    this.to,
    this.idFrom,
    this.time,
    this.text,
    this.workID,
    this.serverMessageType,
    this.serverMessageStatus,
    this.imageUrl,
    this.bookingText,
    this.bookingDate,
    this.bookingTime,
    this.bookingDescription,
    this.bookingImage,
  });

  String id;
  String sender;
  String to;
  String idFrom;
  String time;
  String text;
  String serverMessageType;
  String serverMessageStatus;
  String imageUrl;
  String bookingText;
  String bookingDate;
  String bookingTime;
  String workID;
  String bookingDescription;
  List<String> bookingImage;

  Message copyWith({
    String id,
    String sender,
    String to,
    String idFrom,
    String time,
    String text,
    String workID,
    String serverMessageType,
    String serverMessageStatus,
    String imageUrl,
    String bookingText,
    String bookingDate,
    String bookingTime,
    String bookingDescription,
    List<String> bookingImage,
  }) =>
      Message(
        id: id ?? this.id,
        to: to ?? this.to,
        idFrom: idFrom ?? this.idFrom,
        sender: sender ?? this.sender,
        time: time ?? this.time,
        text: text ?? this.text,
        workID: workID ?? this.workID,
        serverMessageType: serverMessageType ?? this.serverMessageType,
        serverMessageStatus: serverMessageStatus ?? this.serverMessageStatus,
        imageUrl: imageUrl ?? this.imageUrl,
        bookingText: bookingText ?? this.bookingText,
        bookingDate: bookingDate ?? this.bookingDate,
        bookingTime: bookingTime ?? this.bookingTime,
        bookingDescription: bookingDescription ?? this.bookingDescription,
        bookingImage: bookingImage ?? this.bookingImage,
      );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"] == null ? null : json["id"],
        to: json["to"] == null ? null : json["to"],
        idFrom: json["idFrom"] == null ? null : json["idFrom"],
        sender: json["sender"] == null ? null : json["sender"],
        time: json["time"] == null ? null : json["time"],
        text: json["text"] == null ? null : json["text"],
        workID: json["workID"] == null ? null : json["workID"],
        serverMessageType: json["serverMessageType"] == null
            ? null
            : json["serverMessageType"],
        serverMessageStatus: json["serverMessageStatus"] == null
            ? null
            : json["serverMessageStatus"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        bookingText: json["bookingText"] == null ? null : json["bookingText"],
        bookingDate: json["bookingDate"] == null ? null : json["bookingDate"],
        bookingTime: json["bookingTime"] == null ? null : json["bookingTime"],
        bookingDescription: json["bookingDescription"] == null
            ? null
            : json["bookingDescription"],
        bookingImage: json["bookingImage"] == null
            ? null
            : List<String>.from(json["bookingImage"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "to": to == null ? null : to,
        "idFrom": idFrom == null ? null : idFrom,
        "sender": sender == null ? null : sender,
        "time": time == null ? null : time,
        "workID": workID == null ? null : workID,
        "text": text == null ? null : text,
        "serverMessageType":
            serverMessageType == null ? null : serverMessageType,
        "serverMessageStatus":
            serverMessageStatus == null ? null : serverMessageStatus,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "bookingText": bookingText == null ? null : bookingText,
        "bookingDate": bookingDate == null ? null : bookingDate,
        "bookingTime": bookingTime == null ? null : bookingTime,
        "bookingDescription":
            bookingDescription == null ? null : bookingDescription,
        "bookingImage": bookingImage == null
            ? null
            : List<dynamic>.from(bookingImage.map((x) => x)),
      };
}
