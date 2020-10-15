import 'package:bonyeza_kazi/src/infrastructure/auth/models/registration_user_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserMapper {
  ChatUser toChatUser(RegistrationUserModel user) {
    return user == null
        ? null
        : ChatUser(
            id: user.user.id.toString(),
            name: user.user.username,
            imageUrl: user.user.photo,
            phoneNumber: user.user.msisdn,
          );
  }
}
