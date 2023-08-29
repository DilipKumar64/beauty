import 'dart:async';

import 'package:beauty/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      on<SignInRequested>(onSignInRequested);
      on<SignUpRequested>(onSignUpRequested);
      on<GoogleSignInRequested>(onGoogleSignInRequested);
      on<SignOutRequested>(onSignOutRequested);
    });
  }

  FutureOr<void> onSignInRequested(
      SignInRequested event, Emitter<AuthState> emit) async {
    try {
      await authRepository.signIn(email: event.email, password: event.password);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  FutureOr<void> onSignUpRequested(
      SignUpRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    try {
      await authRepository.signUp(email: event.email, password: event.password);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  FutureOr<void> onGoogleSignInRequested(
      GoogleSignInRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    try {
      await authRepository.signInWithGoogle();
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  FutureOr<void> onSignOutRequested(
      SignOutRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    await authRepository.signOut();
    emit(UnAuthenticated());
  }
}
