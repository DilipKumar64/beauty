import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'single_service_event.dart';
part 'single_service_state.dart';

class SingleServiceBloc extends Bloc<SingleServiceEvent, SingleServiceState> {
  SingleServiceBloc()
      : super(SingleServiceState(scheduledDate: DateTime.now())) {
    on<TypeOfServiceUpdated>(onTypeOfServiceUpdated);
    on<SelectServiceTypeToggled>(onSelectServiceTypeToggled);
    on<NewDateSelectedEvent>(onNewDateSelectedEvent);
  }

  FutureOr<void> onTypeOfServiceUpdated(
      TypeOfServiceUpdated event, Emitter<SingleServiceState> emit) {
    emit(state.copyWith(
        serviceType: event.typeOfService, selectedIndex: event.index));
  }

  FutureOr<void> onSelectServiceTypeToggled(
      SelectServiceTypeToggled event, Emitter<SingleServiceState> emit) {
    emit(state.copyWith(isExpanded: !event.isExpanded));
  }

  FutureOr<void> onNewDateSelectedEvent(
      NewDateSelectedEvent event, Emitter<SingleServiceState> emit) {
    print(event.selectedDate);
    emit(state.copyWith(scheduledDate: event.selectedDate));
    print(state.copyWith(scheduledDate: event.selectedDate));
  }
}
