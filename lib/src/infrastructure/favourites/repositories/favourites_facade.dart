import 'dart:io';

import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/failures/favourites_failure.dart';
import 'package:bonyeza_kazi/src/domain/favourites/i_favourites_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/favourites/models/favourites_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: IFavouritesFacade)
class FavouritesFacade implements IFavouritesFacade {
  FavouritesFacade(this._firestore, this._pref);

  final FirebaseFirestore _firestore;
  final SharedPreferences _pref;
  @override
  Future<Either<FavouritesFailure, Unit>> createFavourite(
      {Favourites favourites}) async {
    try {
      final userID = _pref.getString(USER_ID);

      final userDocRef = _firestore.collection('users').doc(userID);

      final favDocRef = userDocRef.collection('favourites');

      await favDocRef.doc(favourites.id).set(favourites.toJson());
      return right(unit);
    } on SocketException catch (e) {
      return left(const FavouritesFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const FavouritesFailure.serverError());
    }
  }

  @override
  Future<Either<FavouritesFailure, Unit>> deleteFavourites(
      {Favourites favourites}) async {
    try {
      final userID = _pref.getString(USER_ID);

      final userDocRef = _firestore.collection('users').doc(userID);

      final favDocRef = userDocRef.collection('favourites');

      await favDocRef.doc(favourites.id).delete();

      return right(unit);
    } on SocketException catch (e) {
      return left(const FavouritesFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const FavouritesFailure.serverError());
    }
  }

  @override
  Stream<Either<FavouritesFailure, KtList<Favourites>>>
      getMyFavourites() async* {
    final userID = _pref.getString(USER_ID);

    final userDocRef = _firestore.collection('users').doc(userID);

    final favDocRef = userDocRef.collection('favourites');

    yield* favDocRef
        .orderBy('time', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<FavouritesFailure, KtList<Favourites>>(
            snapshot.docs
                .map((doc) => Favourites.fromJson(doc.data()))
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith(
      (e) {
        if (e is SocketException) {
          return left(const FavouritesFailure.noInternet());
        } else {
          return left(const FavouritesFailure.serverError());
        }
      },
    );
  }
}
