import 'package:bonyeza_kazi/common/failures/favourites_failure.dart';
import 'package:bonyeza_kazi/src/infrastructure/favourites/models/favourites_model.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

abstract class IFavouritesFacade {
  Stream<Either<FavouritesFailure, KtList<Favourites>>> getMyFavourites();
  Future<Either<FavouritesFailure, Unit>> createFavourite(
      {Favourites favourites});
  Future<Either<FavouritesFailure, Unit>> deleteFavourites(
      {Favourites favourites});
}
