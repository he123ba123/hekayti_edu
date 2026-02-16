part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthRegistered extends AuthState {
  final Map<String, dynamic> user;
  AuthRegistered(this.user);

}

class AuthLoggedIn extends AuthState {
  final Map<String, dynamic> user;
  AuthLoggedIn(this.user);
}

class AuthError extends AuthState {
  final List<String> errors;
  AuthError(this.errors);

}
