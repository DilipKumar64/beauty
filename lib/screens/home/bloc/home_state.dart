part of 'home_bloc.dart';

enum HomeStateStatus {
  sucess,
  failed,
  loading,
}

class HomeState extends Equatable {
  final List<SingleServiceModal> services;
  final HomeStateStatus homeStateStatus;
  final String? errorMessage;
  const HomeState(
      {this.services = const [],
      this.homeStateStatus = HomeStateStatus.loading,
      this.errorMessage});
  HomeState copyWith(
      {String? errorMessage,
      HomeStateStatus? homeStateStatus,
      List<SingleServiceModal>? services}) {
    return HomeState(
      errorMessage: errorMessage ?? this.errorMessage,
      homeStateStatus: homeStateStatus ?? this.homeStateStatus,
      services: services ?? this.services,
    );
  }

  @override
  List<Object?> get props => [services, homeStateStatus, errorMessage];
}
