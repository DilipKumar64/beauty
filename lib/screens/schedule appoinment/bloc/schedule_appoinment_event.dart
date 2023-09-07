part of 'schedule_appoinment_bloc.dart';

abstract class ScheduleAppoinmentEvent extends Equatable {
  const ScheduleAppoinmentEvent();

  @override
  List<Object> get props => [];
}

class ScheduleAppoinmentUpdatedEvent extends ScheduleAppoinmentEvent {
  final int selectedListId;
  final int selectedIndex;

  const ScheduleAppoinmentUpdatedEvent(
      {required this.selectedListId, required this.selectedIndex});
}

class ScheduleAppoinmentTimeUpdatedEvent extends ScheduleAppoinmentEvent {
  final int listId;
  final int index;

  const ScheduleAppoinmentTimeUpdatedEvent(
      {required this.listId, required this.index});
  @override
  List<Object> get props => [listId, index];
}
