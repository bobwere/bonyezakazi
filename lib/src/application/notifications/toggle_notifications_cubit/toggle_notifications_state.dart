part of 'toggle_notifications_cubit.dart';

@freezed
abstract class ToggleNotificationStatusState
    with _$ToggleNotificationStatusState {
  const factory ToggleNotificationStatusState({
    bool inboxmessage,
    bool jobcompletedmessage,
    bool jobrequestmessage,
    bool leaveareviewmessage,
    bool bookingconfirmedmessage,
    bool bookingdeclinedmessage,
    bool isSubmitting,
    Option<Either<NotificationFailure, Unit>> sendingFailureOrSuccessOption,
  }) = _ToggleNotificationStatusState;

  factory ToggleNotificationStatusState.initial() =>
      ToggleNotificationStatusState(
        inboxmessage: true,
        jobcompletedmessage: true,
        jobrequestmessage: true,
        leaveareviewmessage: true,
        bookingconfirmedmessage: true,
        bookingdeclinedmessage: true,
        isSubmitting: true,
        sendingFailureOrSuccessOption: none(),
      );
}
