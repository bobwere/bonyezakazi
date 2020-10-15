import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/src/domain/service_provider/i_service_provider_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_in_progress_jobs_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:bonyeza_kazi/common/failures/sp_details_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'jobs_in_progress_state.dart';
part 'jobs_in_progress_cubit.freezed.dart';

@injectable
class JobsInProgressCubit extends Cubit<JobsInProgressState> {
  JobsInProgressCubit(this._iServiceProviderFacade, this._pref)
      : super(JobsInProgressState.initial());

  IServiceProviderFacade _iServiceProviderFacade;
  SharedPreferences _pref;

  void getJobsInProgress() async {
    emit(JobsInProgressState.loading());
    final currentUser = _pref.getString(USER_ID);

    final failureOrJobsInProgress =
        await _iServiceProviderFacade.getJobsInProgress(id: currentUser);
    failureOrJobsInProgress.fold(
        (failure) => emit(JobsInProgressState.failure(failure)),
        (jobsInProgress) => emit(JobsInProgressState.success(jobsInProgress)));
  }
}
