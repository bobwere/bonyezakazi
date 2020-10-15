import 'package:bonyeza_kazi/common/failures/job_description_failure.dart';
import 'package:bonyeza_kazi/common/failures/job_journey_failure.dart';
import 'package:bonyeza_kazi/src/infrastructure/job_journey/models/job_description_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class IJobJourneyFacade {
  Future<Either<JobDescriptionFailure, JobDescription>> clientJobDescription(
      {String description,
      String bookingDate,
      String bookingTime,
      String location,
      String workerId,
      String agreedPrice,
      String clientId,
      String workTitle,
      List<MultipartFile> workTodoPhotos});
  Future<Either<JobJourneyFailure, Unit>> spAcceptsJob({String workID});
  Future<Either<JobJourneyFailure, Unit>> spCompletesJob(
      {String workID, List<MultipartFile> workDoneImages});
  Future<Either<JobJourneyFailure, Unit>> clientRatesJobDone(
      {String workID, String rate});
}
