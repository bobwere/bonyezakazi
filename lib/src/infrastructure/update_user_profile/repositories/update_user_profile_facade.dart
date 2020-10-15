import 'dart:io';

import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/failures/user_update_failure.dart';
import 'package:bonyeza_kazi/src/domain/update_user_profile/i_update_user_profile_interface.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:bonyeza_kazi/src/infrastructure/update_user_profile/models/update_user_profile_model.dart';

import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: IUpdateUserProfileFacade)
class UpdateUserProfileFacade implements IUpdateUserProfileFacade {
  UpdateUserProfileFacade(this._dio, this._secure, this._pref);
  final Dio _dio;
  final secure.FlutterSecureStorage _secure;
  final SharedPreferences _pref;

  @override
  Future<Either<UserUpdateFailure, UpdateUserProfileModelData>>
      updateUserProfile(
          {String id,
          String username,
          String skills,
          String phone,
          String dialcode,
          String city,
          String location,
          List<MultipartFile> images}) async {
    try {
      UpdateUserProfileModelData updateUserProfileModelData;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      FormData formData = FormData.fromMap({
        "username": username,
        "msisdn": phone,
        "dialcode": dialcode,
        "skills": skills,
        "city": city,
        "location": location,
        "images": images,
      });

      Response response = await _dio.post(
        'https://bonyezakazi.com/api/v1/apiUsers/$id',
        data: formData,
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = UpdateUserProfileModel.fromJson(response.data);
        await _pref.setString(USER_NAME, data.data.username);
        await _pref.setString(USER_PHONE, data.data.msisdn);
        await _pref.setString(USER_SKILLS, data.data.skills);
        await _pref.setString(USER_CITY, data.data.city);
        await _pref.setString(USER_LOCATION, data.data.location);

        updateUserProfileModelData = data.data;
      }

      return right(updateUserProfileModelData);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const UserUpdateFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const UserUpdateFailure.noInternet());
      } else {
        return left(const UserUpdateFailure.serverError());
      }
    }
  }

  @override
  Future<Either<UserUpdateFailure, UpdateUserProfileModelData>>
      updateUserProfilePic({String id, File photo}) async {
    try {
      UpdateUserProfileModelData updateUserProfileModelData;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      var filename = Uuid().v1();

      FormData formData = FormData.fromMap({
        "photo": await MultipartFile.fromFile(photo.path, filename: filename)
      });

      Response response = await _dio.post(
        'https://bonyezakazi.com/api/v1/apiUsers/$id',
        data: formData,
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = UpdateUserProfileModel.fromJson(response.data);

        await _pref.setString(USER_PHOTO_URL, data.data.photo);

        updateUserProfileModelData = data.data;
      }

      return right(updateUserProfileModelData);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const UserUpdateFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const UserUpdateFailure.noInternet());
      } else {
        return left(const UserUpdateFailure.serverError());
      }
    }
  }

  @override
  Future<Either<UserUpdateFailure, UpdateUserProfileModelData>>
      updateUserPassword({String id, String password}) async {
    try {
      UpdateUserProfileModelData updateUserProfileModelData;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      FormData formData = FormData.fromMap({"password": password});

      Response response = await _dio.post(
        'https://bonyezakazi.com/api/v1/apiUsers/$id',
        data: formData,
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = UpdateUserProfileModel.fromJson(response.data);

        updateUserProfileModelData = data.data;
      }

      return right(updateUserProfileModelData);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const UserUpdateFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const UserUpdateFailure.noInternet());
      } else {
        return left(const UserUpdateFailure.serverError());
      }
    }
  }
}
