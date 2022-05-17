part of 'reset_password_cubit.dart';

abstract class ResetPasswordState {
  const ResetPasswordState();

}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  final String error;

  const ResetPasswordError(this.error);

  
}
