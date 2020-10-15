import 'dart:convert';
import 'dart:io';

import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/failures/job_description_failure.dart';
import 'package:bonyeza_kazi/common/failures/job_journey_failure.dart';
import 'package:bonyeza_kazi/src/domain/job_journey/i_job_journey_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/job_journey/models/job_description_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IJobJourneyFacade)
class JobJourneyFacade implements IJobJourneyFacade {
  JobJourneyFacade(this._dio, this._secure);

  final Dio _dio;
  final secure.FlutterSecureStorage _secure;

  @override
  Future<Either<JobDescriptionFailure, JobDescription>> clientJobDescription(
      {String description,
      String bookingDate,
      String bookingTime,
      String location,
      String workTitle,
      String workerId,
      String agreedPrice,
      String clientId,
      List<MultipartFile> workTodoPhotos}) async {
    try {
      JobDescription jobDescription;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      FormData formData = FormData.fromMap({
        "description": description,
        "booking_date": bookingDate,
        "booking_time": bookingTime,
        "agreed_price": "0",
        "location": location,
        "worker_id": workerId,
        "work_todo_images": [...workTodoPhotos],
        "work_title": workTitle,
      });

      Response response = await _dio.post(
        'https://bonyezakazi.com/api/v1/descWork',
        data: formData,
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 201) {
        var data = JobDescriptionModel.fromJson(response.data);
        print(data.data.bookingDate);

        jobDescription = data.data;
      }

      return right(jobDescription);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const JobDescriptionFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobDescriptionFailure.noInternet());
      } else {
        return left(const JobDescriptionFailure.serverError());
      }
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> spAcceptsJob({String workID}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      await _dio.post(
        'https://bonyezakazi.com/api/v1/replyWork/$workID',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      return right(unit);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const JobJourneyFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobJourneyFailure.noInternet());
      } else {
        return left(const JobJourneyFailure.serverError());
      }
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> spCompletesJob(
      {String workID, List<MultipartFile> workDoneImages}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      FormData formData = FormData.fromMap({
        "work_done_images": [...workDoneImages],
      });

      await _dio.post(
        'https://bonyezakazi.com/api/v1/finishWork/$workID',
        data: formData,
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      return right(unit);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const JobJourneyFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobJourneyFailure.noInternet());
      } else {
        return left(const JobJourneyFailure.serverError());
      }
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> clientRatesJobDone(
      {String workID, String rate}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      await _dio.post(
        'https://bonyezakazi.com/api/v1/rateWorker',
        data: {"work": workID, "rating": rate},
        options: Options(
          responseType: ResponseType.json,
          contentType: Headers.formUrlEncodedContentType,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      return right(unit);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const JobJourneyFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobJourneyFailure.noInternet());
      } else {
        return left(const JobJourneyFailure.serverError());
      }
    }
  }
}
