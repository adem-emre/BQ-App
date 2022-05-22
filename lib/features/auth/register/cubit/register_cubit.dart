import 'package:bloc/bloc.dart';

import '../../../../core/auth/models/user_model.dart';
import '../../../../core/auth/service/auth_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final AuthService _authService = AuthService.instance;

  String? name;
  String? surName;
  String? email;
  String? password;

  Future<void> register() async {
    String? userId;
    try {
      if (name != null &&
          surName != null &&
          email != null &&
          password != null) {
        await _authService.signUp(
          email!,
          password!,
          UserModel(name: name!, surName: surName!),
        );
        emit(RegisterSuccess());
      }
      if (userId != null) {
        emit(RegisterSuccess());
      }
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
