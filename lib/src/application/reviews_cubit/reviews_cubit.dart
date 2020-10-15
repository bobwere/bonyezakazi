import 'package:bonyeza_kazi/common/failures/review_failure.dart';
import 'package:bonyeza_kazi/src/domain/service_provider/i_service_provider_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/reviews_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'reviews_state.dart';
part 'reviews_cubit.freezed.dart';

@injectable
class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this._iServiceProviderFacade) : super(ReviewsState.initial());

  final IServiceProviderFacade _iServiceProviderFacade;

  void getServiceProviderReviews({String id}) async {
    emit(ReviewsState.loading());
    final failureOrSuccess =
        await _iServiceProviderFacade.getServiceProviderReviews(id: id);
    failureOrSuccess.fold((failure) => emit(ReviewsState.failure(failure)),
        (reviews) => emit(ReviewsState.success(reviews)));
  }
}
