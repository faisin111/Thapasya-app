import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/features/auth/data/models/user_model.dart';
import 'package:thapasya/apps/features/auth/domain/usecases/auth_login_use_case.dart';
import 'package:thapasya/apps/features/auth/presentation/state/auth_state.dart';
import 'package:thapasya/core/error/exception.dart';

class AuthController extends StateNotifier<AuthState> {
  final AuthLoginUseCase loginCase;
  AuthController(this.loginCase) : super(AuthState());
  Future<void> login(String username, String password) async {
    state = state.copyWithin(loading: true, success: false);
    try {
      final data = await loginCase.call(
        UserModel(username: username, password: password),
      );
      if (data == "staff") {
        state = state.copyWithin(role: Role.teacher);
      }
      state = state.copyWithin(loading: false, success: true);
    } on ApiException catch (e) {
      state = state.copyWithin(
        error: e.message,
        success: false,
        loading: false,
      );
    } catch (e) {
      state = state.copyWithin(
        error: e.toString(),
        success: false,
        loading: false,
      );
    }
  }
}
