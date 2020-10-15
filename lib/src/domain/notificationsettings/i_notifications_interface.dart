import 'package:bonyeza_kazi/common/failures/notification_failure.dart';
import 'package:bonyeza_kazi/src/infrastructure/notifications/models/notification_model.dart';
import 'package:dartz/dartz.dart';

abstract class INotificationsFacade {
  Future<Either<NotificationFailure, Unit>> setInboxMessages(bool status);
  Future<Either<NotificationFailure, Unit>> setJobRequestMessages(bool status);
  Future<Either<NotificationFailure, Unit>> setJobCompletedMessages(
      bool status);
  Future<Either<NotificationFailure, Unit>> setLeftAReviewMessages(bool status);
  Future<Either<NotificationFailure, Unit>> setBookingConfirmedMessages(
      bool status);
  Future<Either<NotificationFailure, Unit>> setBookingDeclinedMessages(
      bool status);
  Stream<Either<NotificationFailure, Notifications>> getNotificationStatus();
}
