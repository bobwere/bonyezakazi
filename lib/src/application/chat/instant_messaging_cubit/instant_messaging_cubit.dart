import 'dart:async';

import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/failures/chat_failure.dart';
import 'package:bonyeza_kazi/src/domain/chat/i_chat_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'instant_messaging_state.dart';
part 'instant_messaging_cubit.freezed.dart';

@injectable
class InstantMessagingCubit extends Cubit<InstantMessagingState> {
  InstantMessagingCubit(this._iChatFacade, this._pref)
      : super(InstantMessagingState.initial());

  IChatFacade _iChatFacade;
  SharedPreferences _pref;

  StreamSubscription<Either<ChatFailure, KtList<Message>>>
      _messagesStreamSubscription;

  void getMessages(String chatroomID) async {
    String currentUserID = _pref.getString(USER_ID);
    String userTypeID = _pref.getString(USER_TYPE_ID);

    await _messagesStreamSubscription?.cancel();
    _messagesStreamSubscription =
        _iChatFacade.getMessages(chatroomID).listen((failureOrChatRooms) {
      failureOrChatRooms.fold(
          (failure) => emit(InstantMessagingState.failure(failure)),
          (allChats) => emit(InstantMessagingState.success(
              allChats, currentUserID, userTypeID)));
    });
  }

  @override
  Future<void> close() async {
    await _messagesStreamSubscription?.cancel();
    return super.close();
  }
}
