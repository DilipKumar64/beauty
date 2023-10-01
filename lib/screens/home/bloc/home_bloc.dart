import 'dart:async';

import 'package:beauty/modals/single_service_model.dart';
import 'package:beauty/repositories/home_repository.dart';
import 'package:beauty/utils/custom_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(const HomeState()) {
    on<FetchServicesDetailEvent>(onFetchServicesDetailEvent);
  }

  FutureOr<void> onFetchServicesDetailEvent(
      FetchServicesDetailEvent event, Emitter<HomeState> emit) async {
    try {
      var list = await homeRepository.fetchServiceDetails();
      if (list == null) {
        throw CustomException(message: 'Unable to fetchdata');
      }
    } catch (e) {
      if (e is CustomException) {
        emit(state.copyWith(errorMessage: e.message));
      } else {
        emit(state.copyWith(
            errorMessage: e.toString(),
            homeStateStatus: HomeStateStatus.failed));
      }
    }
  }
}
