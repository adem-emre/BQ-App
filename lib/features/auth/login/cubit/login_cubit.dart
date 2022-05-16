import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/auth/service/auth_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final AuthService _authService = AuthService.instance;

  String? email;
  String? password;

  Future<void> login() async {
    emit(LoginLoading());
    String? userId;
    try {
      if (email != null && password != null) {
        userId = await _authService.login(email!, password!);
      }

      if (userId != null) {
        emit(LoginSuccess());
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
