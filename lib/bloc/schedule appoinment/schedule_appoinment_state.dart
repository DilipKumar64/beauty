part of 'schedule_appoinment_bloc.dart';

abstract class ScheduleAppoinmentState extends Equatable {
  const ScheduleAppoinmentState();

  @override
  List<Object> get props => [];
}

class ScheduleAppoinmentInitial extends ScheduleAppoinmentState {}

class ScheduleAppoinmentTimeSelected extends ScheduleAppoinmentState {
  final Map<String, int> selectedTime;
  const ScheduleAppoinmentTimeSelected({required this.selectedTime});
  @override
  List<Object> get props => [selectedTime];
}
