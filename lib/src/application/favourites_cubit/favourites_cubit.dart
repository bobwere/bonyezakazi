import 'dart:async';

import 'package:bonyeza_kazi/common/failures/favourites_failure.dart';
import 'package:bonyeza_kazi/src/domain/favourites/i_favourites_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/favourites/models/favourites_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'favourites_state.dart';
part 'favourites_cubit.freezed.dart';

@injectable
class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this._favouritesFacade) : super(FavouritesState.initial());

  IFavouritesFacade _favouritesFacade;

  StreamSubscription<Either<FavouritesFailure, KtList<Favourites>>>
      _favouritesStreamSubscription;

  void getMyFavourites() async {
    emit(FavouritesState.loading());

    await _favouritesStreamSubscription?.cancel();
    _favouritesStreamSubscription =
        _favouritesFacade.getMyFavourites().listen((failureOrFavourites) {
      failureOrFavourites.fold(
          (failure) => emit(FavouritesState.failure(failure)),
          (favourites) => emit(FavouritesState.success(favourites)));
    });
  }

  @override
  Future<void> close() async {
    await _favouritesStreamSubscription?.cancel();
    return super.close();
  }
}
