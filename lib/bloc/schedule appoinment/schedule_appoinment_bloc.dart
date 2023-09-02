import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'schedule_appoinment_event.dart';
part 'schedule_appoinment_state.dart';

class ScheduleAppoinmentBloc
    extends Bloc<ScheduleAppoinmentEvent, ScheduleAppoinmentState> {
  ScheduleAppoinmentBloc() : super(ScheduleAppoinmentInitial()) {
    on<ScheduleAppoinmentTimeUpdatedEvent>(_timeUpdated);
  }

  FutureOr<void> _timeUpdated(ScheduleAppoinmentTimeUpdatedEvent event,
      Emitter<ScheduleAppoinmentState> emit) {
    emit(ScheduleAppoinmentTimeSelected(
        selectedTime: {"listId": event.listId, "selectedIndex": event.index}));
  }
}
