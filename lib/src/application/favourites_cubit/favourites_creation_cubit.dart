import 'package:bonyeza_kazi/common/failures/favourites_failure.dart';
import 'package:bonyeza_kazi/src/domain/favourites/i_favourites_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/favourites/models/favourites_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'favourites_creation_state.dart';
part 'favourites_creation_cubit.freezed.dart';

@injectable
class FavouritesCreationCubit extends Cubit<FavouritesCreationState> {
  FavouritesCreationCubit(this._favouritesFacade)
      : super(FavouritesCreationState.initial());

  IFavouritesFacade _favouritesFacade;

  void createFavourites({Favourites favourites}) async {
    final failureOrSuccess =
        await _favouritesFacade.createFavourite(favourites: favourites);
    failureOrSuccess.fold(
        (failure) => emit(FavouritesCreationState.failure(failure)),
        (success) => emit(FavouritesCreationState.successfullyCreated()));
    emit(FavouritesCreationState.initial());
  }

  void deleteFavourites({Favourites favourites}) async {
    final failureOrSuccess =
        await _favouritesFacade.deleteFavourites(favourites: favourites);
    failureOrSuccess.fold(
        (failure) => emit(FavouritesCreationState.failure(failure)),
        (success) => emit(FavouritesCreationState.successfullyDeleted()));

    emit(FavouritesCreationState.initial());
  }
}
