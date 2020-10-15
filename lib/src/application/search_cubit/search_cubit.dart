import 'package:bonyeza_kazi/common/failures/search_failure.dart';
import 'package:bonyeza_kazi/src/domain/categories/i_categories_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._casualCategoriesFacade) : super(SearchState.initial());

  ICasualCategoriesFacade _casualCategoriesFacade;

  void skillChanged(String skill) {
    emit(state.copyWith.call(
      skill: skill,
      isSubmitting: false,
      searchFailureOrSuccessOption: none(),
    ));
    searchForServiceProviders();
  }

  void locationChanged(String location) {
    emit(state.copyWith.call(
      location: location,
      isSubmitting: false,
      searchFailureOrSuccessOption: none(),
    ));
    searchForServiceProviders();
  }

  void ratingChanged(String rating) {
    emit(state.copyWith.call(
      rating: rating,
      isSubmitting: false,
      searchFailureOrSuccessOption: none(),
    ));
    searchForServiceProviders();
  }

  void searchForServiceProviders() async {
    Either<SearchFailure, KtList<ServiceProvider>> failureOrSuccess;

    emit(state.copyWith.call(
      isSubmitting: true,
      searchFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _casualCategoriesFacade.searchForServiceProviders(
      skills: state.skill,
      location: state.location == 'Location' ? '' : state.location,
      rating: state.rating == 'Rating' ? '' : state.rating,
    );

    emit(state.copyWith.call(
      isSubmitting: false,
      searchFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
