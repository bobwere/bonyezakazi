import 'package:bonyeza_kazi/common/failures/notification_failure.dart';
import 'package:bonyeza_kazi/src/domain/notificationsettings/i_notifications_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'toggle_notifications_cubit.freezed.dart';
part 'toggle_notifications_state.dart';

@injectable
class ToggleNotificationStatusCubit
    extends Cubit<ToggleNotificationStatusState> {
  ToggleNotificationStatusCubit(this._iNotificationsFacade)
      : super(ToggleNotificationStatusState.initial());

  INotificationsFacade _iNotificationsFacade;

  void inboxmessageChanged(bool status) async {
    Either<NotificationFailure, Unit> failureOrSuccess;
    emit(state.copyWith.call(
      inboxmessage: status,
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    failureOrSuccess =
        await _iNotificationsFacade.setInboxMessages(state.inboxmessage);

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void jobcompletedmessageChanged(bool status) async {
    Either<NotificationFailure, Unit> failureOrSuccess;
    emit(state.copyWith.call(
      jobcompletedmessage: status,
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iNotificationsFacade
        .setJobCompletedMessages(state.jobcompletedmessage);

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void jobrequestmessageChanged(bool status) async {
    Either<NotificationFailure, Unit> failureOrSuccess;
    emit(state.copyWith.call(
      jobrequestmessage: status,
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iNotificationsFacade
        .setJobRequestMessages(state.jobrequestmessage);

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void leaveareviewmessageChanged(bool status) async {
    Either<NotificationFailure, Unit> failureOrSuccess;
    emit(state.copyWith.call(
      leaveareviewmessage: status,
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iNotificationsFacade
        .setLeftAReviewMessages(state.leaveareviewmessage);

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void bookingconfirmedmessageChanged(bool status) async {
    Either<NotificationFailure, Unit> failureOrSuccess;
    emit(state.copyWith.call(
      bookingconfirmedmessage: status,
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iNotificationsFacade
        .setBookingConfirmedMessages(state.bookingconfirmedmessage);

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void bookingdeclinedmessageChanged(bool status) async {
    Either<NotificationFailure, Unit> failureOrSuccess;
    emit(state.copyWith.call(
      bookingdeclinedmessage: status,
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iNotificationsFacade
        .setBookingDeclinedMessages(state.bookingconfirmedmessage);

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
