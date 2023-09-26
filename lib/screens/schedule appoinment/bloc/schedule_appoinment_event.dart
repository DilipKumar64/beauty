// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'schedule_appoinment_bloc.dart';

abstract class ScheduleAppoinmentEvent extends Equatable {
  const ScheduleAppoinmentEvent();

  @override
  List<Object> get props => [];
}

class ScheduleAppoinmentErrorEvent extends ScheduleAppoinmentEvent {
  final String errorMessage;

  const ScheduleAppoinmentErrorEvent({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class ScheduleAppoinmentUpdatedEvent extends ScheduleAppoinmentEvent {
  final int selectedListId;
  final int selectedIndex;
  final TimeOfDay time;

  const ScheduleAppoinmentUpdatedEvent({
    required this.selectedListId,
    required this.selectedIndex,
    required this.time,
  });
}

class ScheduleAppoinmentTimeUpdatedEvent extends ScheduleAppoinmentEvent {
  final int listId;
  final int index;

  const ScheduleAppoinmentTimeUpdatedEvent(
      {required this.listId, required this.index});
  @override
  List<Object> get props => [listId, index];
}

class GpayPayPaymentSucessEvent extends ScheduleAppoinmentEvent {
  final GpayPaymentSucessModel gpayPaymentSucessModel;

  const GpayPayPaymentSucessEvent({
    required this.gpayPaymentSucessModel,
  });
}

class SaveAppoinmentDataToFirebaseEvent extends ScheduleAppoinmentEvent {
  final String serviceType;
  final String noOfPeople;
  final String totalPrice;
  final TimeOfDay time;
  final DateTime date;
  const SaveAppoinmentDataToFirebaseEvent({
    required this.serviceType,
    required this.noOfPeople,
    required this.totalPrice,
    required this.time,
    required this.date,
  });
}
