import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thapasya/apps/features/auth/data/data_source/auth_local_ds.dart';
import 'package:thapasya/apps/features/auth/data/data_source/auth_remote_ds.dart';
import 'package:thapasya/apps/features/auth/data/repository/auth_implements.dart';
import 'package:thapasya/apps/features/auth/domain/usecases/auth_login_use_case.dart';
import 'package:thapasya/core/di/main_di.dart';

final localProvider = Provider<AuthLocalDs>((ref) {
  final prefs = ref.read(prefsProvider);
  return AuthLocalDs(prefs);
});

final remoteProvider = Provider<AuthRemoteDs>((ref) {
  final client = ref.read(dioProvider);
  return AuthRemoteDs(client);
});

final repoProvider = Provider<AuthImplements>((ref) {
  final r = ref.read(remoteProvider);
  final l = ref.read(localProvider);
  return AuthImplements(r, l);
});

final loginCaseProvider = Provider<AuthLoginUseCase>((ref) {
  final casee = ref.read(repoProvider);
  return AuthLoginUseCase(casee);
});
