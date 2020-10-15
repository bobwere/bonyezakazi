import 'package:bonyeza_kazi/common/failures/review_failure.dart';
import 'package:bonyeza_kazi/common/failures/sp_details_failure.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/reviews_model.dart';

import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/service_provider_details_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_completed_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_in_progress_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_pending_jobs_model.dart';

import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

abstract class IServiceProviderFacade {
  Future<Either<SPDetailsFailure, ServiceProviderDetail>>
      getServiceProviderDetails({String id});
  Future<Either<ReviewFailure, KtList<Review>>> getServiceProviderReviews(
      {String id});
  Future<Either<SPDetailsFailure, SpPendingJobs>> getPendingJobs({String id});
  Future<Either<SPDetailsFailure, SpInProgressJobs>> getJobsInProgress(
      {String id});
  Future<Either<SPDetailsFailure, SpCompletedJobs>> getJobsCompleted(
      {String id});
}
