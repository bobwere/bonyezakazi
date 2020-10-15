import 'dart:io';

import 'package:bonyeza_kazi/common/failures/chat_failure.dart';
import 'package:bonyeza_kazi/src/domain/chat/i_chat_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: IChatFacade)
class ChatFacade implements IChatFacade {
  ChatFacade(this._firestore);
  final FirebaseFirestore _firestore;
  @override
  Future<Either<ChatFailure, Unit>> createChatRoom(
      {ChatRoom chatroom, String chatroomID}) async {
    try {
      final chatRoomDocRef = _firestore.collection('chatrooms').doc(chatroomID);
      await chatRoomDocRef.set(chatroom.toJson());

      return right(unit);
    } on SocketException catch (e) {
      return left(const ChatFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const ChatFailure.serverError());
    }
  }

  @override
  Future<Either<ChatFailure, Unit>> createMessage(
      {String chatroomID, Message message}) async {
    try {
      await _firestore
          .collection('chatrooms')
          .doc(chatroomID)
          .collection("chats")
          .doc(message.id)
          .set(message.toJson());

      return right(unit);
    } on SocketException catch (e) {
      return left(const ChatFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const ChatFailure.serverError());
    }
  }

  @override
  Stream<Either<ChatFailure, KtList<ChatRoom>>> getUserChats(
      String currentUser) async* {
    final chatroomsCol = _firestore.collection('chatrooms');

    yield* chatroomsCol
        .where('users', arrayContains: currentUser)
        .orderBy('time', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<ChatFailure, KtList<ChatRoom>>(
            snapshot.docs
                .map((doc) => ChatRoom.fromJson(doc.data()))
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith(
      (e) {
        if (e is SocketException) {
          return left(const ChatFailure.noInternet());
        } else {
          print("ERROR IS THIS FRIEND " + e.toString());
          return left(const ChatFailure.serverError());
        }
      },
    );
  }

  @override
  Stream<Either<ChatFailure, KtList<Message>>> getMessages(
      String chatroomID) async* {
    final chatroomsCol = _firestore.collection('chatrooms');

    yield* chatroomsCol
        .doc(chatroomID)
        .collection("chats")
        .orderBy('time', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<ChatFailure, KtList<Message>>(
            snapshot.docs
                .map((doc) => Message.fromJson(doc.data()))
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith(
      (e) {
        if (e is SocketException) {
          return left(const ChatFailure.noInternet());
        } else {
          return left(const ChatFailure.serverError());
        }
      },
    );
  }

  @override
  Future<Either<ChatFailure, Unit>> upDateChatRoomDetails(
      {ChatRoom chatroom, String chatroomID}) async {
    try {
      final chatRoomDocRef = _firestore.collection('chatrooms').doc(chatroomID);
      await chatRoomDocRef.update(chatroom.toJson());

      return right(unit);
    } on SocketException catch (e) {
      return left(const ChatFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const ChatFailure.serverError());
    }
  }

  @override
  Future<Either<ChatFailure, Unit>> upDateMessageDetails(
      {String chatroomID, Message message}) async {
    try {
      final messageDocRef = _firestore
          .collection('chatrooms')
          .doc(chatroomID)
          .collection('chats')
          .doc(message.id);

      await messageDocRef.update(message.toJson());

      return right(unit);
    } on SocketException catch (e) {
      return left(const ChatFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const ChatFailure.serverError());
    }
  }
}
