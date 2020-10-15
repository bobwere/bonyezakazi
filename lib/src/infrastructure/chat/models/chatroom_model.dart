import 'dart:convert';

ChatRoom chatRoomFromJson(String str) => ChatRoom.fromJson(json.decode(str));

String chatRoomToJson(ChatRoom data) => json.encode(data.toJson());

class ChatRoom {
  ChatRoom({
    this.chatroomId,
    this.time,
    this.text,
    this.unread,
    this.currentTextFrom,
    this.name,
    this.users,
    this.chatUsersDetails,
  });

  String chatroomId;
  String time;
  String text;
  bool unread;
  String currentTextFrom;
  String name;
  List<String> users;
  List<ChatUser> chatUsersDetails;

  ChatRoom copyWith({
    String chatroomId,
    String time,
    String text,
    bool unread,
    String currentTextFrom,
    String name,
    List<String> users,
    List<ChatUser> chatUsersDetails,
  }) =>
      ChatRoom(
        time: time ?? this.time,
        text: text ?? this.text,
        currentTextFrom: currentTextFrom ?? this.currentTextFrom,
        name: name ?? this.name,
        users: users ?? this.users,
        unread: unread ?? this.unread,
        chatroomId: chatroomId ?? this.chatroomId,
        chatUsersDetails: chatUsersDetails ?? this.chatUsersDetails,
      );

  factory ChatRoom.fromJson(Map<String, dynamic> json) => ChatRoom(
        chatroomId: json["chatroomId"] == null ? null : json["chatroomId"],
        time: json["time"] == null ? null : json["time"],
        text: json["text"] == null ? null : json["text"],
        unread: json["unread"] == null ? null : json["unread"],
        currentTextFrom:
            json["currentTextFrom"] == null ? null : json["currentTextFrom"],
        name: json["name"] == null ? null : json["name"],
        users: json["users"] == null
            ? null
            : List<String>.from(json["users"].map((x) => x)),
        chatUsersDetails: json["chatUsersDetails"] == null
            ? null
            : List<ChatUser>.from(
                json["chatUsersDetails"].map((x) => ChatUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chatroomId": chatroomId == null ? null : chatroomId,
        "time": time == null ? null : time,
        "text": text == null ? null : text,
        "unread": unread == null ? null : unread,
        "currentTextFrom": currentTextFrom == null ? null : currentTextFrom,
        "name": name == null ? null : name,
        "users": users == null ? null : List<dynamic>.from(users.map((x) => x)),
        "chatUsersDetails": chatUsersDetails == null
            ? null
            : List<dynamic>.from(chatUsersDetails.map((x) => x.toJson())),
      };
}

class ChatUser {
  ChatUser({
    this.id,
    this.imageUrl,
    this.phoneNumber,
    this.name,
  });

  String id;
  String imageUrl;
  String phoneNumber;
  String name;

  ChatUser copyWith({
    String id,
    String imageUrl,
    String phoneNumber,
    bool name,
  }) =>
      ChatUser(
        imageUrl: imageUrl ?? this.imageUrl,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
        id: json["id"] == null ? null : json["id"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "name": name == null ? null : name,
      };
}
