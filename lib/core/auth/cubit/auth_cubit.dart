import 'package:bloc/bloc.dart';
import 'package:bq_app/core/auth/models/user_model.dart';
import 'package:bq_app/core/auth/service/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final AuthService _authService = AuthService.instance;

  String? get getUserId => _authService.uid;

  bool get isAuthanticated => getUserId != null;

  

  setUserInfo() async {
    emit(AuthInfoLoading());
    UserModel user = await _authService.getUser();
    emit( AuthInfoSuccess(user));
  }
  
  
  logout() async {
    await _authService.logout();
  }
}
