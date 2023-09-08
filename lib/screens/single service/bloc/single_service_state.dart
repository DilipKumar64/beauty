part of 'single_service_bloc.dart';

class SingleServiceState extends Equatable {
  const SingleServiceState(
      {this.serviceType = 'Select Service Type',
      this.selectedIndex = 0,
      this.isExpanded = false,
      this.noOfPeople = 1,
      required this.scheduledDate});

  final bool isExpanded;
  final String serviceType;
  final int selectedIndex;
  final int noOfPeople;
  final DateTime scheduledDate;
  @override
  List<Object> get props =>
      [isExpanded, serviceType, selectedIndex, scheduledDate, noOfPeople];
  SingleServiceState copyWith({
    String? serviceType,
    bool? isExpanded,
    int? selectedIndex,
    int? noOfPeople,
    DateTime? scheduledDate,
  }) {
    return SingleServiceState(
      isExpanded: isExpanded ?? this.isExpanded,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      serviceType: serviceType ?? this.serviceType,
      noOfPeople: noOfPeople ?? this.noOfPeople,
      scheduledDate: scheduledDate ?? this.scheduledDate,
    );
  }
}
