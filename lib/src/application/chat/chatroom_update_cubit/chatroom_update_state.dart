part of 'chatroom_update_cubit.dart';

@freezed
abstract class ChatroomUpdateState with _$ChatroomUpdateState {
  const factory ChatroomUpdateState.initial() = Initial;
  const factory ChatroomUpdateState.success() = Success;
  const factory ChatroomUpdateState.failure(ChatFailure failure) = Failure;
}
