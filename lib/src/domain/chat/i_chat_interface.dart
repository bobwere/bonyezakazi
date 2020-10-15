import 'package:bonyeza_kazi/common/failures/chat_failure.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

abstract class IChatFacade {
  Future<Either<ChatFailure, Unit>> createChatRoom(
      {ChatRoom chatroom, String chatroomID});
  Future<Either<ChatFailure, Unit>> upDateChatRoomDetails(
      {ChatRoom chatroom, String chatroomID});
  Future<Either<ChatFailure, Unit>> createMessage(
      {String chatroomID, Message message});
  Future<Either<ChatFailure, Unit>> upDateMessageDetails(
      {String chatroomID, Message message});
  Stream<Either<ChatFailure, KtList<ChatRoom>>> getUserChats(
      String currentUser);
  Stream<Either<ChatFailure, KtList<Message>>> getMessages(String chatroomID);
}
