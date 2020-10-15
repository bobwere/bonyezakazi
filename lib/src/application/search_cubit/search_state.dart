part of 'search_cubit.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    String location,
    String rating,
    String skill,
    bool isSubmitting,
    Option<Either<SearchFailure, KtList<ServiceProvider>>>
        searchFailureOrSuccessOption,
  }) = _SearchState;

  factory SearchState.initial() => SearchState(
        location: "",
        rating: "",
        skill: "Plumbing",
        isSubmitting: false,
        searchFailureOrSuccessOption: none(),
      );
}
