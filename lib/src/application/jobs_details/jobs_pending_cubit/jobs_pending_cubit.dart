import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/src/domain/service_provider/i_service_provider_interface.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:bonyeza_kazi/common/failures/sp_details_failure.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_pending_jobs_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'jobs_pending_state.dart';
part 'jobs_pending_cubit.freezed.dart';

@injectable
class JobsPendingCubit extends Cubit<JobsPendingState> {
  JobsPendingCubit(this._iServiceProviderFacade, this._pref)
      : super(JobsPendingState.initial());

  IServiceProviderFacade _iServiceProviderFacade;
  SharedPreferences _pref;

  void getPendingJobs() async {
    emit(JobsPendingState.loading());
    final currentUser = _pref.getString(USER_ID);

    final failureOrPendingJobs =
        await _iServiceProviderFacade.getPendingJobs(id: currentUser);
    failureOrPendingJobs.fold(
        (failure) => emit(JobsPendingState.failure(failure)),
        (jobsPending) => emit(JobsPendingState.success(jobsPending)));
  }
}
