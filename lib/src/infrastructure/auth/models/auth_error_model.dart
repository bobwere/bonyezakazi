import 'dart:convert';

AuthError authErrorFromJson(String str) => AuthError.fromJson(json.decode(str));

String authErrorToJson(AuthError data) => json.encode(data.toJson());

class AuthError {
  AuthError({
    this.code,
    this.message,
  });

  int code;
  List<String> message;

  AuthError copyWith({
    int code,
    List<String> message,
  }) =>
      AuthError(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory AuthError.fromJson(Map<String, dynamic> json) => AuthError(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null
            ? null
            : List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message":
            message == null ? null : List<dynamic>.from(message.map((x) => x)),
      };
}
