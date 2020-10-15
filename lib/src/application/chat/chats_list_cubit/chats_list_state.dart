part of 'chats_list_cubit.dart';

@freezed
abstract class ChatsListState with _$ChatsListState {
  const factory ChatsListState.initial() = Initial;
  const factory ChatsListState.loading() = Loading;
  const factory ChatsListState.success(
      KtList<ChatRoom> allChats, String currentUserID) = Success;
  const factory ChatsListState.failure(ChatFailure failure) = Failure;
}
