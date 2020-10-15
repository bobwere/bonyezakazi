import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/failures/job_journey_failure.dart';
import 'package:bonyeza_kazi/src/domain/chat/i_chat_interface.dart';
import 'package:bonyeza_kazi/src/domain/job_journey/i_job_journey_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'client_rates_job_done_state.dart';
part 'client_rates_job_done_cubit.freezed.dart';

@injectable
class ClientRatesJobDoneCubit extends Cubit<ClientRatesJobDoneState> {
  ClientRatesJobDoneCubit(
      this._iJobJourneyFacade, this._iChatFacade, this._pref)
      : super(ClientRatesJobDoneState.initial());

  final IJobJourneyFacade _iJobJourneyFacade;
  final IChatFacade _iChatFacade;
  SharedPreferences _pref;

  void ratingChanged(String rating) {
    emit(state.copyWith.call(
      rating: rating,
      isSubmitting: false,
      sendingFailureOrSuccessOption: none(),
    ));
  }

  void clientRatesJobDone(
      String workID, ChatRoom chatRoom, Message message) async {
    emit(state.copyWith.call(
      isSubmitting: true,
      sendingFailureOrSuccessOption: none(),
    ));

    Either<JobJourneyFailure, Unit> failureOrSuccess;
    failureOrSuccess = await _iJobJourneyFacade.clientRatesJobDone(
        workID: workID, rate: state.rating);

    emit(state.copyWith.call(
      isSubmitting: false,
      sendingFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    failureOrSuccess.fold((failure) {}, (unit) async {
      final currentUser = _pref.getString(USER_ID);

      final otherUser = currentUser == chatRoom.users[0]
          ? chatRoom.users[1]
          : chatRoom.users[0];

      final updatedMessage = message.copyWith(
        serverMessageStatus: SERVER_MSG_STATUS_RATED,
        to: otherUser,
        idFrom: currentUser,
      );

      await _iChatFacade.upDateMessageDetails(
          chatroomID: chatRoom.chatroomId, message: updatedMessage);
    });
  }
}
