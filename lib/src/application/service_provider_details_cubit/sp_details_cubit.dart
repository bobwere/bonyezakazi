import 'package:bonyeza_kazi/common/failures/sp_details_failure.dart';
import 'package:bonyeza_kazi/src/domain/service_provider/i_service_provider_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/service_provider_details_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';

part 'sp_details_state.dart';
part 'sp_details_cubit.freezed.dart';

@injectable
class SPDetailsCubit extends Cubit<SPDetailsState> {
  SPDetailsCubit(this._iServiceProviderFacade)
      : super(SPDetailsState.initial());

  final IServiceProviderFacade _iServiceProviderFacade;

  void getServiceProviderDetails({String id}) async {
    emit(SPDetailsState.loading());
    final failureOrSuccess =
        await _iServiceProviderFacade.getServiceProviderDetails(id: id);
    failureOrSuccess.fold((failure) => emit(SPDetailsState.failure(failure)),
        (spDetails) => emit(SPDetailsState.success(spDetails)));
  }
}
