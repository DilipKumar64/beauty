import 'dart:async';

import 'package:beauty/modals/gpay_payment_sucess_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'schedule_appoinment_event.dart';
part 'schedule_appoinment_state.dart';

class ScheduleAppoinmentBloc
    extends Bloc<ScheduleAppoinmentEvent, ScheduleAppoinmentState> {
  ScheduleAppoinmentBloc() : super(const ScheduleAppoinmentState()) {
    on<ScheduleAppoinmentUpdatedEvent>(_timeUpdated);
    on<GpayPayPaymentSucessEvent>(onGpayPayPaymentSucessEvent);
  }

  FutureOr<void> _timeUpdated(ScheduleAppoinmentUpdatedEvent event,
      Emitter<ScheduleAppoinmentState> emit) {
    emit(state.copyWith(
      selectedIndex: event.selectedIndex,
      selectedListId: event.selectedListId,
    ));
  }

  FutureOr<void> onGpayPayPaymentSucessEvent(
      GpayPayPaymentSucessEvent event, Emitter<ScheduleAppoinmentState> emit) {
    List<GpayPaymentSucessModel> gpayPaymentSucessModelList = [];
    gpayPaymentSucessModelList.add(event.gpayPaymentSucessModel);
    emit(
        state.copyWith(gpayPaymentSucessModelList: gpayPaymentSucessModelList));
  }
}
