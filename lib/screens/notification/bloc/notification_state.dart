part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final AppoinmentModel? appoinment;
  const NotificationState({
    this.appoinment,
  });

  @override
  List<Object?> get props => [appoinment];

  NotificationState copyWith(AppoinmentModel? appoinment) {
    return NotificationState(
      appoinment: appoinment ?? this.appoinment,
    );
  }
}

class NotificationInitial extends NotificationState {}
