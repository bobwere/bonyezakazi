part of 'favourites_creation_cubit.dart';

@freezed
abstract class FavouritesCreationState with _$FavouritesCreationState {
  const factory FavouritesCreationState.initial() = Initial;
  const factory FavouritesCreationState.successfullyCreated() =
      SuccessfullyCreated;
  const factory FavouritesCreationState.successfullyDeleted() =
      SuccessfullyDeleted;

  const factory FavouritesCreationState.failure(FavouritesFailure failure) =
      Failure;
}
