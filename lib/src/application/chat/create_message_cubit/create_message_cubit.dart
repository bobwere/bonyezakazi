import 'dart:io';
import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/failures/chat_failure.dart';
import 'package:bonyeza_kazi/src/domain/chat/i_chat_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'create_message_state.dart';
part 'create_message_cubit.freezed.dart';

@injectable
class CreateMessageCubit extends Cubit<CreateMessageState> {
  CreateMessageCubit(this._iChatFacade, this._pref)
      : super(CreateMessageState.initial());

  final IChatFacade _iChatFacade;
  final SharedPreferences _pref;

  void messageChanged(String message) {
    emit(state.copyWith.call(
      message: message,
      isSubmittingText: false,
      isSubmittingImage: false,
      sendingFailureOrSuccessOption: none(),
    ));
  }

  void photoChanged(File photo) {
    emit(state.copyWith.call(
      photo: photo,
      isSubmittingText: false,
      isSubmittingImage: false,
      sendingFailureOrSuccessOption: none(),
    ));
  }

  void sendText(String chatroomID, ChatRoom chatroom) async {
    emit(state.copyWith.call(
      isSubmittingText: true,
      isSubmittingImage: false,
      sendingFailureOrSuccessOption: none(),
    ));

    Either<ChatFailure, Unit> failureOrSuccess;
    String currentUser = _pref.getString(USER_ID);

    final otherUser = currentUser == chatroom.users[0]
        ? chatroom.users[1]
        : chatroom.users[0];

    final textMessage = Message(
      id: Uuid().v1(),
      text: state.message,
      sender: currentUser,
      idFrom: currentUser,
      to: otherUser,
      serverMessageType: SERVER_MSG_TYPE_NORMAL,
      time: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    failureOrSuccess = await _iChatFacade.createMessage(
      chatroomID: chatroomID,
      message: textMessage,
    );

    emit(state.copyWith.call(
      isSubmittingText: false,
      isSubmittingImage: false,
      showErrorMessages: true,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
    failureOrSuccess.fold((_) {}, (success) async {
      final updateChatroom = chatroom.copyWith(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        currentTextFrom: currentUser,
        text: state.message,
        unread: true,
      );

      await _iChatFacade.upDateChatRoomDetails(
          chatroomID: chatroomID, chatroom: updateChatroom);
    });
  }

  void sendImage(String chatroomID, ChatRoom chatroom) async {
    emit(state.copyWith.call(
      isSubmittingText: false,
      isSubmittingImage: true,
      sendingFailureOrSuccessOption: none(),
    ));

    Either<ChatFailure, Unit> failureOrSuccess;
    String currentUser = _pref.getString(USER_ID);

    final otherUser = currentUser == chatroom.users[0]
        ? chatroom.users[1]
        : chatroom.users[0];

    String imageUrl = await uploadImage(state.photo);

    final imageMessage = Message(
        id: Uuid().v1(),
        imageUrl: imageUrl,
        sender: currentUser,
        text: 'Image',
        to: otherUser,
        idFrom: currentUser,
        serverMessageType: SERVER_MSG_TYPE_IMAGE,
        time: DateTime.now().millisecondsSinceEpoch.toString());

    failureOrSuccess = await _iChatFacade.createMessage(
      chatroomID: chatroomID,
      message: imageMessage,
    );

    emit(state.copyWith.call(
      isSubmittingText: false,
      isSubmittingImage: false,
      showErrorMessages: true,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    failureOrSuccess.fold((_) {}, (success) async {
      final updateChatroom = chatroom.copyWith(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        currentTextFrom: currentUser,
        text: 'New Image',
        unread: true,
      );

      await _iChatFacade.upDateChatRoomDetails(
          chatroomID: chatroomID, chatroom: updateChatroom);
    });
  }

  Future<String> uploadImage(File file) async {
    var imageFileName = Uuid().v1().toString();
    var imgData = await file.readAsBytes();

    StorageReference ref =
        FirebaseStorage.instance.ref().child('chatImages/$imageFileName');
    StorageUploadTask uploadTask = ref.putData(imgData);

    var downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

    return downloadUrl.toString();
  }
}
