import 'dart:io';

import 'package:bonyeza_kazi/common/failures/auth_failure.dart';
import 'package:bonyeza_kazi/src/domain/auth/i_auth_inteface.dart';
import 'package:bonyeza_kazi/src/infrastructure/auth/models/registration_user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:uuid/uuid.dart';

part 'registration_cubit.freezed.dart';
part 'registration_state.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this._iAuthFacade) : super(RegistrationState.initial());

  final IAuthFacade _iAuthFacade;

  void usernameChanged(String username) {
    emit(state.copyWith.call(
      username: username,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    ));
  }

  void passwordChanged(String password) {
    emit(state.copyWith.call(
      password: password,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    ));
  }

  void cityChanged(String city) {
    emit(state.copyWith.call(
      city: city,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    ));
  }

  void locationChanged(String location) {
    emit(state.copyWith.call(
      location: location,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    ));
  }

  void phoneChanged(String phone) {
    emit(state.copyWith.call(
      phone: phone,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    ));
  }

  void skillChanged(String skill) {
    emit(state.copyWith.call(
      skill: skill,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    ));
  }

  void photoChanged(File photo) {
    emit(state.copyWith.call(
      photo: photo,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    ));
  }

  void workPhotosChanged(List<Asset> photos) {
    emit(state.copyWith.call(
      workPhotos: photos,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    ));
  }

  void dialCodeChanged(String dialCode) {
    emit(state.copyWith.call(
      dialcode: dialCode,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    ));
  }

  void registerAsClientWithUsernameAndPassword() async {
    Either<AuthFailure, RegistrationUserModel> failureOrSuccess;

    emit(state.copyWith.call(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));

    failureOrSuccess =
        await _iAuthFacade.registerAsClientWithUsernameAndPassword(
      password: state.password,
      city: state.city,
      dialcode: state.dialcode,
      location: state.location,
      phone: state.phone,
      username: state.username,
      //photo: state.photo,
    );

    emit(state.copyWith.call(
      isSubmitting: false,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void registerAsServiceProviderWithUsernameAndPassword() async {
    Either<AuthFailure, RegistrationUserModel> failureOrSuccess;

    emit(state.copyWith.call(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));

    final workPhotos = await convertToMultipart(state.workPhotos);

    failureOrSuccess =
        await _iAuthFacade.registerAsServiceProviderWithUsernameAndPassword(
      password: state.password,
      city: state.city,
      skill: state.skill,
      dialcode: state.dialcode,
      location: state.location,
      phone: state.phone,
      username: state.username,
      photo: state.photo,
      workPhotos: workPhotos,
    );

    emit(state.copyWith.call(
      isSubmitting: false,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  Future<List<MultipartFile>> convertToMultipart(List<Asset> assets) async {
    List<MultipartFile> myWorkPhotos = [];
    for (var workPhoto in assets) {
      ByteData byteData = await workPhoto.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      MultipartFile multipartFile = MultipartFile.fromBytes(
        imageData,
        filename: Uuid().v1(),
      );
      myWorkPhotos.add(multipartFile);
    }
    return myWorkPhotos;
  }
}
