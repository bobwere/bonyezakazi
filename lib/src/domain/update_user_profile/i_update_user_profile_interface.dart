import 'dart:io';

import 'package:bonyeza_kazi/common/failures/user_update_failure.dart';
import 'package:bonyeza_kazi/src/infrastructure/update_user_profile/models/update_user_profile_model.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class IUpdateUserProfileFacade {
  Future<Either<UserUpdateFailure, UpdateUserProfileModelData>>
      updateUserProfile({
    String id,
    String username,
    String skills,
    String phone,
    String dialcode,
    String city,
    String location,
    List<MultipartFile> images,
  });
  Future<Either<UserUpdateFailure, UpdateUserProfileModelData>>
      updateUserProfilePic({
    String id,
    File photo,
  });
  Future<Either<UserUpdateFailure, UpdateUserProfileModelData>>
      updateUserPassword({
    String id,
    String password,
  });
}
