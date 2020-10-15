part of 'notification_cubit.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = Initial;
  const factory NotificationsState.loading() = Loading;
  const factory NotificationsState.success(Notifications notification) =
      Success;
  const factory NotificationsState.failure(NotificationFailure failure) =
      Failure;
}
