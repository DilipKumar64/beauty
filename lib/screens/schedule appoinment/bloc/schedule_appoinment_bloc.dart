import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'schedule_appoinment_event.dart';
part 'schedule_appoinment_state.dart';

class ScheduleAppoinmentBloc
    extends Bloc<ScheduleAppoinmentEvent, ScheduleAppoinmentState> {
  ScheduleAppoinmentBloc() : super(const ScheduleAppoinmentState()) {
    on<ScheduleAppoinmentUpdatedEvent>(_timeUpdated);
  }

  FutureOr<void> _timeUpdated(ScheduleAppoinmentUpdatedEvent event,
      Emitter<ScheduleAppoinmentState> emit) {
    emit(state.copyWith(
      selectedIndex: event.selectedIndex,
      selectedListId: event.selectedListId,
    ));
  }
}
