part of 'schedule_appoinment_bloc.dart';

class ScheduleAppoinmentState extends Equatable {
  final int selectedListId;
  final int selectedIndex;
  final List<GpayPaymentSucessModel> gpayPaymentSucessModelList;
  const ScheduleAppoinmentState({
    this.selectedIndex = 0,
    this.selectedListId = 0,
    this.gpayPaymentSucessModelList = const <GpayPaymentSucessModel>[],
  });

  ScheduleAppoinmentState copyWith({
    int? selectedListId,
    int? selectedIndex,
    List<GpayPaymentSucessModel>? gpayPaymentSucessModelList,
  }) {
    return ScheduleAppoinmentState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedListId: selectedListId ?? this.selectedListId,
      gpayPaymentSucessModelList:
          gpayPaymentSucessModelList ?? this.gpayPaymentSucessModelList,
    );
  }

  @override
  List<Object> get props =>
      [selectedIndex, selectedListId, gpayPaymentSucessModelList];
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
