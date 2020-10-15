import 'dart:async';

import 'package:bonyeza_kazi/common/failures/notification_failure.dart';

import 'package:bonyeza_kazi/src/domain/notificationsettings/i_notifications_interface.dart';

import 'package:bonyeza_kazi/src/infrastructure/notifications/models/notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._iNotificationsFacade)
      : super(NotificationsState.initial());

  INotificationsFacade _iNotificationsFacade;

  StreamSubscription<Either<NotificationFailure, Notifications>>
      _notificationsStreamSubscription;

  void getNotificationsStatus() async {
    emit(NotificationsState.loading());

    await _notificationsStreamSubscription?.cancel();
    _notificationsStreamSubscription = _iNotificationsFacade
        .getNotificationStatus()
        .listen((failureOrNotifications) {
      failureOrNotifications.fold(
          (failure) => emit(NotificationsState.failure(failure)),
          (notification) => emit(NotificationsState.success(notification)));
    });
  }

  @override
  Future<void> close() async {
    await _notificationsStreamSubscription?.cancel();
    return super.close();
  }
}
