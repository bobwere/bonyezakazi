import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites_failure.freezed.dart';

@freezed
abstract class FavouritesFailure with _$FavouritesFailure {
  const factory FavouritesFailure.serverError() = ServerError;
  const factory FavouritesFailure.noInternet() = NoInternet;
}
