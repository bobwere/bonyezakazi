import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/failures/job_journey_failure.dart';
import 'package:bonyeza_kazi/src/domain/chat/i_chat_interface.dart';
import 'package:bonyeza_kazi/src/domain/job_journey/i_job_journey_interface.dart';
import 'package:bonyeza_kazi/src/domain/service_provider/i_service_provider_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'work_completed_state.dart';
part 'work_completed_cubit.freezed.dart';

@injectable
class WorkCompletedCubit extends Cubit<WorkCompletedState> {
  WorkCompletedCubit(
    this._iJobJourneyFacade,
    this._pref,
    this._iChatFacade,
  ) : super(WorkCompletedState.initial());

  final IJobJourneyFacade _iJobJourneyFacade;

  final IChatFacade _iChatFacade;
  final SharedPreferences _pref;

  void workDonePhotosChanged(List<Asset> photos) {
    emit(state.copyWith.call(
      photos: photos,
      isSubmitting: false,
      sendingFailureOrSuccessOption: none(),
    ));
  }

  void spCompletesJob(String workID, ChatRoom chatRoom, Message message) async {
    emit(state.copyWith.call(
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    final workPhotos = await convertToMultipart(state.photos);

    Either<JobJourneyFailure, Unit> failureOrSuccess;
    failureOrSuccess = await _iJobJourneyFacade.spCompletesJob(
        workID: workID, workDoneImages: workPhotos);

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    String currentUser = _pref.getString(USER_ID);

    final otherUser = currentUser == chatRoom.users[0]
        ? chatRoom.users[1]
        : chatRoom.users[0];

    failureOrSuccess.fold((failure) {}, (unit) async {
      final currentUser = _pref.getString(USER_ID);
      final workCompletedMessage = message.copyWith(
        id: Uuid().v1(),
        serverMessageType: SERVER_MSG_TYPE_WORK_COMPLETED,
        serverMessageStatus: SERVER_MSG_STATUS_UNRATED,
        sender: SERVER,
        to: otherUser,
        idFrom: currentUser,
        workID: workID,
        time: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      await _iChatFacade.createMessage(
          chatroomID: chatRoom.chatroomId, message: workCompletedMessage);

      final updateChatroom = chatRoom.copyWith(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        currentTextFrom: currentUser,
        text: 'Work Completed',
        unread: true,
      );

      await _iChatFacade.upDateChatRoomDetails(
          chatroomID: chatRoom.chatroomId, chatroom: updateChatroom);

      final updatedMessage = message.copyWith(
        serverMessageStatus: SERVER_MSG_STATUS_WORK_COMPLETED,
      );

      await _iChatFacade.upDateMessageDetails(
          chatroomID: chatRoom.chatroomId, message: updatedMessage);
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
}
