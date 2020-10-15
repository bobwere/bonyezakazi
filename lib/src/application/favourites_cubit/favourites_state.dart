part of 'favourites_cubit.dart';

@freezed
abstract class FavouritesState with _$FavouritesState {
  const factory FavouritesState.initial() = Initial;
  const factory FavouritesState.loading() = Loading;
  const factory FavouritesState.success(KtList<Favourites> allFavourites) =
      Success;
  const factory FavouritesState.failure(FavouritesFailure failure) = Failure;
}
