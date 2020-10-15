import 'package:bonyeza_kazi/common/failures/chat_failure.dart';
import 'package:bonyeza_kazi/src/domain/chat/i_chat_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chatroom_update_state.dart';
part 'chatroom_update_cubit.freezed.dart';

@injectable
class ChatroomUpdateCubit extends Cubit<ChatroomUpdateState> {
  ChatroomUpdateCubit(this._iChatFacade) : super(ChatroomUpdateState.initial());

  final IChatFacade _iChatFacade;

  void upDateChatRoomDetails(String chatroomID, ChatRoom chatroom) async {
    await _iChatFacade.upDateChatRoomDetails(
      chatroomID: chatroomID,
      chatroom: chatroom,
    );
  }
}
