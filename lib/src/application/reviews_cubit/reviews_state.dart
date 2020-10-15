part of 'reviews_cubit.dart';

@freezed
abstract class ReviewsState with _$ReviewsState {
  const factory ReviewsState.initial() = Initial;
  const factory ReviewsState.loading() = Loading;
  const factory ReviewsState.success(KtList<Review> spReviews) = Success;
  const factory ReviewsState.failure(ReviewFailure failure) = Failure;
}
