import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/src/domain/service_provider/i_service_provider_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_completed_jobs_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:bonyeza_kazi/common/failures/sp_details_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'jobs_completed_state.dart';
part 'jobs_completed_cubit.freezed.dart';

@injectable
class JobsCompletedCubit extends Cubit<JobsCompletedState> {
  JobsCompletedCubit(this._iServiceProviderFacade, this._pref)
      : super(JobsCompletedState.initial());

  IServiceProviderFacade _iServiceProviderFacade;
  SharedPreferences _pref;

  void getJobsCompleted() async {
    emit(JobsCompletedState.loading());
    final currentUser = _pref.getString(USER_ID);

    final failureOrJobsCompleted =
        await _iServiceProviderFacade.getJobsCompleted(id: currentUser);
    failureOrJobsCompleted.fold(
        (failure) => emit(JobsCompletedState.failure(failure)),
        (jobsCompleted) => emit(JobsCompletedState.success(jobsCompleted)));
  }
}
