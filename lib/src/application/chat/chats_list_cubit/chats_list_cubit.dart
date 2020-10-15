import 'dart:async';

import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/failures/chat_failure.dart';
import 'package:bonyeza_kazi/src/domain/chat/i_chat_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'chats_list_state.dart';
part 'chats_list_cubit.freezed.dart';

@injectable
class ChatsListCubit extends Cubit<ChatsListState> {
  ChatsListCubit(this._iChatFacade, this._pref)
      : super(ChatsListState.initial());

  IChatFacade _iChatFacade;
  SharedPreferences _pref;

  StreamSubscription<Either<ChatFailure, KtList<ChatRoom>>>
      _chatsListStreamSubscription;

  void getChatsList() async {
    emit(ChatsListState.loading());

    String currentUserID = _pref.getString(USER_ID);
    await _chatsListStreamSubscription?.cancel();
    _chatsListStreamSubscription =
        _iChatFacade.getUserChats(currentUserID).listen((failureOrChatRooms) {
      failureOrChatRooms.fold(
          (failure) => emit(ChatsListState.failure(failure)),
          (allChats) => emit(ChatsListState.success(allChats, currentUserID)));
    });
  }

  @override
  Future<void> close() async {
    await _chatsListStreamSubscription?.cancel();
    return super.close();
  }
}
