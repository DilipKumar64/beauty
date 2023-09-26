import 'dart:async';
import 'dart:developer';

import 'package:beauty/modals/gpay_payment_sucess_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repositories/schedule_appoinment_repository.dart';

part 'schedule_appoinment_event.dart';
part 'schedule_appoinment_state.dart';

class ScheduleAppoinmentBloc
    extends Bloc<ScheduleAppoinmentEvent, ScheduleAppoinmentState> {
  final ScheduleAppoinmentRepository repository;
  ScheduleAppoinmentBloc({required this.repository})
      : super(const ScheduleAppoinmentState()) {
    on<ScheduleAppoinmentUpdatedEvent>(_timeUpdated);
    on<GpayPayPaymentSucessEvent>(onGpayPayPaymentSucessEvent);
    on<ScheduleAppoinmentErrorEvent>(onScheduleAppoinmentErrorEvent);
    on<SaveAppoinmentDataToFirebaseEvent>(onSaveAppoinmentDataToFirebaseEvent);
  }

  void _timeUpdated(ScheduleAppoinmentUpdatedEvent event,
      Emitter<ScheduleAppoinmentState> emit) {
    emit(state.copyWith(
        selectedIndex: event.selectedIndex,
        selectedListId: event.selectedListId,
        time: event.time));
  }

  void onGpayPayPaymentSucessEvent(GpayPayPaymentSucessEvent event,
      Emitter<ScheduleAppoinmentState> emit) async {
    ScheduleAppoinmentRepository repo = ScheduleAppoinmentRepository();
    List<GpayPaymentSucessModel> gpayPaymentSucessModelList = [];
    gpayPaymentSucessModelList.add(event.gpayPaymentSucessModel);
    gpayPaymentSucessModelList[0].paymentTime = DateTime.now();
    try {
      await repository
          .storePaymentInfoToFirebase(gpayPaymentSucessModelList[0]);
      log(state.time.toString());

      emit(GpaySucessState(newTime: state.time));
    } catch (e) {
      log(e.toString());
    }
    emit(
        state.copyWith(gpayPaymentSucessModelList: gpayPaymentSucessModelList));
  }

  void onScheduleAppoinmentErrorEvent(ScheduleAppoinmentErrorEvent event,
      Emitter<ScheduleAppoinmentState> emit) {
    emit(ScheduleAppoinmentErrorState(errorMessage: event.errorMessage));
  }

  FutureOr<void> onSaveAppoinmentDataToFirebaseEvent(
      SaveAppoinmentDataToFirebaseEvent event,
      Emitter<ScheduleAppoinmentState> emit) {
    DateTime date = event.date;
    TimeOfDay time = event.time;
    DateTime finalDateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);

    Map<String, String> data = {
      "appoinmentTime": finalDateTime.toString(),
      "noOfPeople": event.noOfPeople,
      "serviceType": event.serviceType,
      "totalPrice": event.totalPrice
    };
    repository.saveAppoinmentDataToFirebase(data);
  }
}
