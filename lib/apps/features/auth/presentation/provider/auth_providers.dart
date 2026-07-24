import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/features/auth/presentation/controller/auth_controller.dart';
import 'package:thapasya/apps/features/auth/presentation/state/auth_state.dart';


import 'package:thapasya/core/di/auth_di.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  final re = ref.read(loginCaseProvider);
  return AuthController(re);
});

final visibiltyProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

