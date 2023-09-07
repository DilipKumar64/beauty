part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState(
      {this.code =
          const CountryCode(name: 'India', code: 'IN', dialCode: '+91')});
  final CountryCode code;

  AuthState copyWith({
    CountryCode? code,
  }) {
    return AuthState(
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => [code];
}

// When the user presses the signin or signup button the state is changed to loading first and then to Authenticated.
class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
  @override
  List<Object?> get props => [error];
}

class PhoneAuthError extends AuthState {
  final String error;

  PhoneAuthError({required this.error});

  @override
  List<Object> get props => [error];
}

class PhoneAuthCodeSentSuccess extends AuthState {
  final String verificationId;
  const PhoneAuthCodeSentSuccess({
    required this.verificationId,
  });
  @override
  List<Object> get props => [verificationId];
}
