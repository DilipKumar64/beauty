part of 'single_service_bloc.dart';

class SingleServiceEvent extends Equatable {
  const SingleServiceEvent();

  @override
  List<Object> get props => [];
}

class SetInitialValue extends SingleServiceEvent {
  final DateTime dateTime;

  const SetInitialValue({required this.dateTime});
  @override
  List<Object> get props => [dateTime];
}

class TypeOfServiceUpdated extends SingleServiceEvent {
  final String typeOfService;
  final int index;
  const TypeOfServiceUpdated(
      {required this.index, required this.typeOfService});
  @override
  List<Object> get props => [typeOfService];
}

class SelectServiceTypeToggled extends SingleServiceEvent {
  final bool isExpanded;

  const SelectServiceTypeToggled({required this.isExpanded});
  @override
  List<Object> get props => [isExpanded];
}

class NewDateSelectedEvent extends SingleServiceEvent {
  final DateTime selectedDate;

  const NewDateSelectedEvent({required this.selectedDate});
  @override
  List<Object> get props => [];
}

class NoOfPeoplechanged extends SingleServiceEvent {
  final int noOfPeople;

  const NoOfPeoplechanged({required this.noOfPeople});
  @override
  List<Object> get props => [noOfPeople];
}
