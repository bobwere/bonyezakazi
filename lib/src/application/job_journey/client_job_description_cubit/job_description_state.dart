part of 'job_description_cubit.dart';

@freezed
abstract class JobDescriptionState with _$JobDescriptionState {
  const factory JobDescriptionState({
    String description,
    String bookingDate,
    String bookingTime,
    String workTitle,
    String workerImageURL,
    String workerName,
    String location,
    String workerID,
    List<Asset> workTodoPhotos,
    bool showErrorMessages,
    bool isSubmitting,
    Option<Either<JobDescriptionFailure, JobDescription>>
        bookingFailureOrSuccessOption,
  }) = _JobDescriptionState;

  factory JobDescriptionState.initial() => JobDescriptionState(
        description: '',
        bookingDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        bookingTime: DateFormat('HH:mm').format(DateTime.now()),
        workerID: '',
        workTitle: '',
        workerImageURL: '',
        workerName: '',
        location: '',
        workTodoPhotos: [],
        showErrorMessages: false,
        isSubmitting: false,
        bookingFailureOrSuccessOption: none(),
      );
}
