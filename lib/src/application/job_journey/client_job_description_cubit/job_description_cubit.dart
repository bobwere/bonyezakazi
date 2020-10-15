import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/failures/job_description_failure.dart';
import 'package:bonyeza_kazi/src/domain/chat/i_chat_interface.dart';
import 'package:bonyeza_kazi/src/domain/job_journey/i_job_journey_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/job_journey/models/job_description_model.dart';
import 'package:dartz/dartz.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'job_description_state.dart';
part 'job_description_cubit.freezed.dart';

@injectable
class JobDescriptionCubit extends Cubit<JobDescriptionState> {
  JobDescriptionCubit(this._iJobJourneyFacade, this._pref, this._iChatFacade)
      : super(JobDescriptionState.initial());

  final IJobJourneyFacade _iJobJourneyFacade;
  final IChatFacade _iChatFacade;
  final SharedPreferences _pref;

  void descriptionChanged(String description) {
    emit(state.copyWith.call(
      description: description,
      isSubmitting: false,
      bookingFailureOrSuccessOption: none(),
    ));
  }

  void bookingDateChanged(String bookingDate) {
    emit(state.copyWith.call(
      bookingDate: bookingDate,
      isSubmitting: false,
      bookingFailureOrSuccessOption: none(),
    ));
  }

  void bookingTimeChanged(String bookingTime) {
    emit(state.copyWith.call(
      bookingTime: bookingTime,
      isSubmitting: false,
      bookingFailureOrSuccessOption: none(),
    ));
  }

  void locationChanged(String location) {
    emit(state.copyWith.call(
      location: location,
      isSubmitting: false,
      bookingFailureOrSuccessOption: none(),
    ));
  }

  void workerImageURLChanged(String workerImageURL) {
    emit(state.copyWith.call(
      workerImageURL: workerImageURL,
      isSubmitting: false,
      bookingFailureOrSuccessOption: none(),
    ));
  }

  void workerNameChanged(String workerName) {
    emit(state.copyWith.call(
      workerName: workerName,
      isSubmitting: false,
      bookingFailureOrSuccessOption: none(),
    ));
  }

  void workTitleChanged(String workTitle) {
    emit(state.copyWith.call(
      workTitle: workTitle,
      isSubmitting: false,
      bookingFailureOrSuccessOption: none(),
    ));
  }

  void workerIDChanged(String workerID) {
    emit(state.copyWith.call(
      workerID: workerID,
      isSubmitting: false,
      bookingFailureOrSuccessOption: none(),
    ));
  }

  void workTodoPhotosChanged(List<Asset> photos) {
    emit(state.copyWith.call(
      workTodoPhotos: photos,
      isSubmitting: false,
      bookingFailureOrSuccessOption: none(),
    ));
  }

  void clientJobDescriptionSubmission() async {
    Either<JobDescriptionFailure, JobDescription> failureOrSuccess;

    emit(state.copyWith.call(
      isSubmitting: true,
      bookingFailureOrSuccessOption: none(),
    ));

    final clientID = _pref.getString(USER_ID);

    final workPhotos = await convertToMultipart(state.workTodoPhotos);

    failureOrSuccess = await _iJobJourneyFacade.clientJobDescription(
      description: state.description,
      workTitle: state.workTitle,
      bookingDate: state.bookingDate,
      bookingTime: state.bookingTime,
      location: state.location,
      workerId: state.workerID,
      clientId: clientID,
      workTodoPhotos: workPhotos,
    );

    emit(state.copyWith.call(
      isSubmitting: false,
      showErrorMessages: true,
      bookingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    failureOrSuccess.fold((failure) {}, (jobDescription) async {
      final clientImageURL = _pref.getString(USER_PHOTO_URL);
      final clientName = _pref.getString(USER_NAME);
      String chatroomID = createChatRoomId(clientID, state.workerID);
      final clientChatUser = ChatUser(
        id: clientID,
        imageUrl: clientImageURL,
        name: clientName,
      );
      final workerChatUser = ChatUser(
        id: state.workerID,
        imageUrl: state.workerImageURL,
        name: state.workerName,
      );
      final chatroom = ChatRoom(
        chatroomId: chatroomID,
        users: [clientID, state.workerID],
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        chatUsersDetails: [clientChatUser, workerChatUser],
        currentTextFrom: clientID,
        text: 'Enquiry...',
        unread: true,
      );
      await _iChatFacade.createChatRoom(
          chatroom: chatroom, chatroomID: chatroomID);

      final enquiryMessage = Message(
        id: Uuid().v1(),
        sender: SERVER,
        serverMessageType: SERVER_MSG_TYPE_ENQUIRY,
        serverMessageStatus: SERVER_MSG_STATUS_ENQUIRY,
        bookingDate: state.bookingDate,
        to: state.workerID,
        idFrom: clientID,
        bookingTime: state.bookingTime,
        bookingText: state.workTitle,
        bookingDescription: state.description,
        bookingImage: [...jobDescription?.workTodoImages],
        workID: jobDescription?.id,
        time: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      await _iChatFacade.createMessage(
        chatroomID: chatroomID,
        message: enquiryMessage,
      );
    });
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

  createChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }
}
