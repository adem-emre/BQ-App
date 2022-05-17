import 'package:bloc/bloc.dart';
import 'package:bq_app/core/auth/service/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  final AuthService _authService = AuthService.instance;
  String? mail;

  Future<void> resetPassword() async {
    try {
      print(mail);
      await _authService.resetPassword(mail!);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordError(e.toString()));
    }
  }


}
