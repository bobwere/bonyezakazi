import 'dart:io';

import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/failures/review_failure.dart';
import 'package:bonyeza_kazi/common/failures/sp_details_failure.dart';
import 'package:bonyeza_kazi/src/domain/service_provider/i_service_provider_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/reviews_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/service_provider_details_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_pending_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_in_progress_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_completed_jobs_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@LazySingleton(as: IServiceProviderFacade)
class ServiceProviderFacade implements IServiceProviderFacade {
  ServiceProviderFacade(this._dio, this._secure, this._dioCacheManager);
  final Dio _dio;
  final secure.FlutterSecureStorage _secure;
  final DioCacheManager _dioCacheManager;

  @override
  Future<Either<SPDetailsFailure, ServiceProviderDetail>>
      getServiceProviderDetails({String id}) async {
    try {
      ServiceProviderDetail serviceDetail;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/getWorker/$id',
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

      if (response.statusCode == 200) {
        var data = ServiceProviderDetailModel.fromJson(response.data);
        serviceDetail = data.data;
      }
      return right(serviceDetail);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }

  @override
  Future<Either<ReviewFailure, KtList<Review>>> getServiceProviderReviews(
      {String id}) async {
    try {
      KtList<Review> listReviews;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/reviews/$id',
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

      if (response.statusCode == 200) {
        var data = ReviewModel.fromJson(response.data);
        listReviews = data.reviews.toImmutableList();
      }
      return right(listReviews);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const ReviewFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const ReviewFailure.noInternet());
      } else {
        return left(const ReviewFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SPDetailsFailure, SpCompletedJobs>> getJobsCompleted(
      {String id}) async {
    try {
      SpCompletedJobs spCompletedJobs;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/jobs_completed/$id',
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

      if (response.statusCode == 200) {
        var data = SpCompletedJobs.fromJson(response.data);
        spCompletedJobs = data;
      }
      return right(spCompletedJobs);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SPDetailsFailure, SpInProgressJobs>> getJobsInProgress(
      {String id}) async {
    try {
      SpInProgressJobs spInProgressJobs;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/jobs_in_progress/$id',
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

      if (response.statusCode == 200) {
        var data = SpInProgressJobs.fromJson(response.data);
        spInProgressJobs = data;
      }
      return right(spInProgressJobs);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SPDetailsFailure, SpPendingJobs>> getPendingJobs(
      {String id}) async {
    try {
      SpPendingJobs spPendingJobs;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/jobs_pending/$id',
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

      if (response.statusCode == 200) {
        var data = SpPendingJobs.fromJson(response.data);
        spPendingJobs = data;
      }
      return right(spPendingJobs);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }
}
