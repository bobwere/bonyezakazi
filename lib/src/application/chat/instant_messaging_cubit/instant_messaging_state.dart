part of 'instant_messaging_cubit.dart';

@freezed
abstract class InstantMessagingState with _$InstantMessagingState {
  const factory InstantMessagingState.initial() = Initial;
  const factory InstantMessagingState.loading() = Loading;
  const factory InstantMessagingState.success(KtList<Message> allMessages,
      String currentUserID, String userTypeID) = Success;
  const factory InstantMessagingState.failure(ChatFailure failure) = Failure;
}
