part of 'single_service_bloc.dart';

class SingleServiceState extends Equatable {
  const SingleServiceState(
      {this.serviceType = 'Select Service Type',
      this.selectedIndex = 0,
      this.isExpanded = false,
      required this.scheduledDate});

  final bool isExpanded;
  final String serviceType;
  final int selectedIndex;
  final DateTime scheduledDate;
  @override
  List<Object> get props =>
      [isExpanded, serviceType, selectedIndex, scheduledDate];
  SingleServiceState copyWith({
    String? serviceType,
    bool? isExpanded,
    int? selectedIndex,
    DateTime? scheduledDate,
  }) {
    return SingleServiceState(
      isExpanded: isExpanded ?? this.isExpanded,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      serviceType: serviceType ?? this.serviceType,
      scheduledDate: scheduledDate ?? this.scheduledDate,
    );
  }
}
