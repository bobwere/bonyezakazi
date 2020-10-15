part of 'update_user_profile_cubit.dart';

@freezed
abstract class UpdateUserProfileState with _$UpdateUserProfileState {
  const factory UpdateUserProfileState({
    @required String username,
    @required String password,
    @required String id,
    @required String city,
    @required String location,
    @required String phone,
    @required File photo,
    List<Asset> workPhotos,
    String skill,
    @required String dialcode,
    @required bool isSubmitting,
    @required
        Option<Either<UserUpdateFailure, UpdateUserProfileModelData>>
            userUpdateFailureOrSuccessOption,
  }) = _UpdateUserProfileState;

  factory UpdateUserProfileState.initial() => UpdateUserProfileState(
        username: '',
        password: '',
        id: '',
        city: '',
        location: '',
        phone: '',
        skill: '',
        workPhotos: [],
        photo: File(''),
        dialcode: '+254',
        isSubmitting: false,
        userUpdateFailureOrSuccessOption: none(),
      );
}
