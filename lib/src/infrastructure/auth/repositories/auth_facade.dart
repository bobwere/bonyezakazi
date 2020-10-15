import 'dart:io';
import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/failures/auth_failure.dart';
import 'package:bonyeza_kazi/src/domain/auth/i_auth_inteface.dart';
import 'package:bonyeza_kazi/src/infrastructure/auth/mapper/user_mapper.dart';
import 'package:bonyeza_kazi/src/infrastructure/auth/models/auth_error_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/auth/models/login_user_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/auth/models/registration_user_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/notifications/models/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  AuthFacade(this._dio, this._pref, this._secure, this._firestore,
      this._userMapper, this._auth);
  final Dio _dio;
  final SharedPreferences _pref;
  final secure.FlutterSecureStorage _secure;
  final FirebaseFirestore _firestore;
  final UserMapper _userMapper;
  final FirebaseAuth _auth;

  @override
  Future<Either<AuthFailure, RegistrationUserModel>>
      registerAsClientWithUsernameAndPassword({
    String username,
    String city,
    String location,
    String phone,
    String dialcode,
    String password,
    //File photo
  }) async {
    try {
      var filename = Uuid().v1();
      RegistrationUserModel user;
      FormData formData = FormData.fromMap({
        "username": username,
        "user_type_id": "5",
        "phone": phone,
        "dialcode": dialcode,
        "password": password,
        "msisdn": phone,
      });
      //  "photo": await MultipartFile.fromFile(photo.path, filename: filename

      Response response = await _dio.post(
          'https://bonyezakazi.com/api/v1/registerUser',
          data: formData,
          options: Options(
              responseType: ResponseType.json,
              receiveTimeout: 3000,
              sendTimeout: 5000,
              headers: {
                "Accept": "application/json",
                "content-type": "application/json"
              }));

      if (response.statusCode == 200) {
        user = RegistrationUserModel.fromJson(response.data);
        await _secure.write(key: ACCESS_TOKEN, value: user.user.accessToken);
        await _pref.setString(USER_ID, user.user.id.toString());
        await _pref.setString(USER_PHOTO_URL, user.user.photo);
        await _pref.setString(USER_NAME, user.user.username);
        await _pref.setString(USER_TYPE_ID, user.user.userTypeId);
        await _pref.setString(USER_PHONE, user.user.msisdn);

        //SAVE USER TO FIRESTORE PLus Notification settings
        final userCollection = _firestore.collection('users');

        final chatUser = _userMapper.toChatUser(user);
        await userCollection
            .doc(user.user.id.toString())
            .set(chatUser.toJson())
            .then((value) {});

        final notificationSettings = Notifications(
          inboxmessages: true,
          jobcompletedmessages: true,
          jobrequestmessages: true,
          leaveareviewmessages: true,
          bookingconfirmedmessages: true,
          bookingdeclinedmessages: true,
        );

        await userCollection
            .doc(user.user.id.toString())
            .collection('notificationsettings')
            .doc('notificationsettings')
            .set(notificationSettings.toJson());

        //   await _auth.signInWithCustomToken(user.user.accessToken);
      }

      return right(user);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        if (e.response.statusCode == 422) {
          final authError = AuthError.fromJson(e.response.data);
          final erStr = authError.message[0];
          return left(AuthFailure.formValidation(erStr));
        }

        return left(const AuthFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const AuthFailure.noInternet());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, RegistrationUserModel>>
      registerAsServiceProviderWithUsernameAndPassword(
          {String username,
          String city,
          String location,
          String phone,
          String skill,
          String dialcode,
          List<MultipartFile> workPhotos,
          String password,
          File photo}) async {
    try {
      var filename = Uuid().v1();
      RegistrationUserModel user;
      FormData formData = FormData.fromMap({
        "username": username,
        "user_type_id": "4",
        "city": city,
        "location": location,
        "phone": phone,
        "dialcode": dialcode,
        "password": password,
        "msisdn": phone,
        "skills": skill,
        "photo": await MultipartFile.fromFile(photo.path, filename: filename),
        "images": [...workPhotos]
      });

      Response response = await _dio.post(
          'https://bonyezakazi.com/api/v1/registerUser',
          data: formData,
          options: Options(
              responseType: ResponseType.json,
              receiveTimeout: 3000,
              sendTimeout: 5000,
              headers: {
                "Accept": "application/json",
                "content-type": "application/json"
              }));

      if (response.statusCode == 200) {
        user = RegistrationUserModel.fromJson(response.data);
        await _secure.write(key: ACCESS_TOKEN, value: user.user.accessToken);
        await _pref.setString(USER_ID, user.user.id.toString());
        await _pref.setString(USER_PHOTO_URL, user.user.photo);
        await _pref.setString(USER_NAME, user.user.username);
        await _pref.setString(USER_TYPE_ID, user.user.userTypeId);
        await _pref.setString(USER_PHONE, user.user.msisdn);
        await _pref.setString(USER_SKILLS, user.user.skills);
        await _pref.setString(USER_CITY, user.user.city);
        await _pref.setString(USER_LOCATION, user.user.location);

        //SAVE USER TO FIRESTORE plus notifications
        final userCollection = _firestore.collection('users');

        final chatUser = _userMapper.toChatUser(user);
        await userCollection
            .doc(user.user.id.toString())
            .set(chatUser.toJson());

        final notificationSettings = Notifications(
          inboxmessages: true,
          jobcompletedmessages: true,
          jobrequestmessages: true,
          leaveareviewmessages: true,
          bookingconfirmedmessages: true,
          bookingdeclinedmessages: true,
        );

        await userCollection
            .doc(user.user.id.toString())
            .collection('notificationsettings')
            .doc('notificationsettings')
            .set(notificationSettings.toJson());

        // await _auth.signInWithCustomToken(user.user.accessToken);
      }

      return right(user);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        if (e.response.statusCode == 422) {
          final authError = AuthError.fromJson(e.response.data);
          final erStr = authError.message[0];
          return left(AuthFailure.formValidation(erStr));
        }

        return left(const AuthFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        return left(const AuthFailure.noInternet());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, LoginUserModel>> signInWithEmailAndPassword(
      {String username, String password}) async {
    try {
      LoginUserModel user;

      Response response = await _dio.post(
          'https://bonyezakazi.com/api/v1/newUserLogin',
          data: {"username": username, "password": password},
          options: Options(
              responseType: ResponseType.json,
              receiveTimeout: 3000,
              sendTimeout: 5000,
              headers: {
                "Accept": "application/json",
                "content-type": "application/json",
              }));

      if (response.statusCode == 200) {
        user = LoginUserModel.fromJson(response.data);
        await _secure.write(key: ACCESS_TOKEN, value: user.data.accessToken);
        await _pref.setString(USER_ID, user.data.id.toString());
        await _pref.setString(USER_PHOTO_URL, user.data.photo);
        await _pref.setString(USER_NAME, user.data.username);
        await _pref.setString(USER_TYPE_ID, user.data.userTypeId);
        await _pref.setString(USER_PHONE, user.data.msisdn);
        await _pref.setString(USER_SKILLS, user.data.skills);
        await _pref.setString(USER_CITY, user.data.city);
        await _pref.setString(USER_LOCATION, user.data.location);
        // await _auth.signInWithCustomToken(user.data.accessToken);
      }

      return right(user);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        if (e.response.statusCode == 401) {
          return left(AuthFailure.userNotFound());
        }

        return left(const AuthFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        return left(const AuthFailure.noInternet());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, LoginUserModel>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, LoginUserModel>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Option<LoginUserModel> getSignedInUser() {
    var id = _pref.getString(USER_ID);
    var user =
        id != null ? LoginUserModel(data: LoginUserModelData(id: id)) : null;
    return optionOf(user);
  }

  @override
  Future<void> signOut() async {
    return Future.wait([
      // _auth.signOut(),
      _secure.deleteAll(),
      _pref.remove(USER_ID),
      _pref.remove(USER_TYPE_ID),
      _pref.remove(USER_PHOTO_URL),
      _pref.remove(USER_CITY),
      _pref.remove(USER_PHONE),
      _pref.remove(USER_SKILLS),
      _pref.remove(USER_LOCATION),
      _pref.remove(USER_NAME),
    ]);
  }
}
