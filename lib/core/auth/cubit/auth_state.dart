part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthInfoLoading extends AuthState {}

class AuthInfoSuccess extends AuthState {
  final UserModel user;

  const AuthInfoSuccess(this.user);

  @override
  List<Object> get props => [user];
}
