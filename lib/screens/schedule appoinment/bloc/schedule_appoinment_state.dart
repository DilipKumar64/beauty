part of 'schedule_appoinment_bloc.dart';

class ScheduleAppoinmentState extends Equatable {
  const ScheduleAppoinmentState({
    this.selectedIndex = 0,
    this.selectedListId = 0,
  });
  final int selectedListId;
  final int selectedIndex;
  @override
  List<Object> get props => [selectedIndex, selectedListId];

  ScheduleAppoinmentState copyWith({
    int? selectedListId,
    int? selectedIndex,
  }) {
    return ScheduleAppoinmentState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedListId: selectedListId ?? this.selectedListId,
    );
  }
}
