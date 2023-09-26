part of 'schedule_appoinment_bloc.dart';

class ScheduleAppoinmentState extends Equatable {
  final int selectedListId;
  final int selectedIndex;
  final TimeOfDay time;
  final List<GpayPaymentSucessModel> gpayPaymentSucessModelList;
  const ScheduleAppoinmentState(
      {this.selectedIndex = 0,
      this.selectedListId = 0,
      this.gpayPaymentSucessModelList = const <GpayPaymentSucessModel>[],
      this.time = const TimeOfDay(hour: 9, minute: 0)});

  ScheduleAppoinmentState copyWith(
      {int? selectedListId,
      int? selectedIndex,
      List<GpayPaymentSucessModel>? gpayPaymentSucessModelList,
      TimeOfDay? time}) {
    return ScheduleAppoinmentState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        selectedListId: selectedListId ?? this.selectedListId,
        gpayPaymentSucessModelList:
            gpayPaymentSucessModelList ?? this.gpayPaymentSucessModelList,
        time: time ?? this.time);
  }

  @override
  List<Object> get props =>
      [selectedIndex, selectedListId, gpayPaymentSucessModelList, time];
}

class ScheduleAppoinmentErrorState extends ScheduleAppoinmentState {
  final String errorMessage;

  const ScheduleAppoinmentErrorState(
      {super.selectedIndex,
      super.selectedListId,
      super.gpayPaymentSucessModelList,
      required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class GpaySucessState extends ScheduleAppoinmentState {
  final TimeOfDay newTime;

  const GpaySucessState(
      {super.selectedIndex,
      super.selectedListId,
      super.gpayPaymentSucessModelList,
      required this.newTime});
  @override
  List<Object> get props => [newTime];
}
