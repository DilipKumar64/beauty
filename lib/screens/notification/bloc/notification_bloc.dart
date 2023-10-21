import 'dart:async';

import 'package:beauty/modals/appoinment_model.dart';
import 'package:beauty/repositories/notification_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository repository;
  NotificationBloc({required this.repository}) : super(NotificationInitial()) {
    on<NotificationInitialEvent>(onNotificationInitialEvent);
  }

  FutureOr<void> onNotificationInitialEvent(
      NotificationInitialEvent event, Emitter<NotificationState> emit) async {
    AppoinmentModel? appoinmentModel = await repository.fetchAppoinmentData();
    if (appoinmentModel != null) {
      emit(state.copyWith(appoinmentModel));
    }
  }
}
