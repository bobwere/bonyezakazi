import 'dart:io';

import 'package:bonyeza_kazi/common/failures/auth_failure.dart';
import 'package:bonyeza_kazi/src/infrastructure/auth/models/login_user_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/auth/models/registration_user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, RegistrationUserModel>>
      registerAsClientWithUsernameAndPassword({
    @required String username,
    @required String city,
    @required String location,
    @required String phone,
    @required String dialcode,
    @required String password,
    //  File photo,
  });
  Future<Either<AuthFailure, RegistrationUserModel>>
      registerAsServiceProviderWithUsernameAndPassword({
    @required String username,
    @required String city,
    @required String location,
    @required String phone,
    @required String skill,
    @required String dialcode,
    @required String password,
    @required File photo,
    @required List<MultipartFile> workPhotos,
  });
  Option<LoginUserModel> getSignedInUser();
  Future<Either<AuthFailure, LoginUserModel>> signInWithEmailAndPassword(
      {@required String username, @required String password});
  Future<Either<AuthFailure, LoginUserModel>> signInWithFacebook();
  Future<Either<AuthFailure, LoginUserModel>> signInWithGoogle();
  Future<void> signOut();
}
