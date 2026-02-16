import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/remote_data_source/auth_service.dart';

part 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  Future<void> register({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoading());
    final result = await _authService.register(
      userName: userName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    if (result['success'] == true) {
      emit(AuthRegistered(result));
    } else {
      emit(AuthError(result['errorMessages']));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await _authService.login(
      email: email,
      password: password,
    );

    if (result['success'] == true) {
      emit(AuthLoggedIn(result));
    } else {
      emit(AuthError(result['errorMessages'] ?? ['Login failed']));
    }
  }
}
