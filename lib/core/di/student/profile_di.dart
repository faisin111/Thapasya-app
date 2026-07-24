import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:thapasya/apps/student/features/profile/data/data_source/profile_local_ds.dart';
import 'package:thapasya/apps/student/features/profile/data/data_source/profile_remote_ds.dart';
import 'package:thapasya/apps/student/features/profile/data/repository/profile_impl.dart';
import 'package:thapasya/apps/student/features/profile/domain/repository/profile_repo.dart';
import 'package:thapasya/apps/student/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:thapasya/apps/student/features/profile/domain/usecases/logout_profile_u_c.dart';
import 'package:thapasya/core/di/main_di.dart';

final localProvider = Provider<ProfileLocalDs>((ref) {
  final prefs = ref.read(prefsProvider);
  return ProfileLocalDs(prefs);
});

final remoteProvider = Provider<ProfileRemoteDs>((ref) {
  final client = ref.read(dioProvider);
  return ProfileRemoteDs(client);
});

final repoProvider = Provider<ProfileRepo>((ref) {
  final r = ref.read(remoteProvider);
  final l=ref.read(localProvider);
  return ProfileImpl(r,l);
});

final logoutProfileCProvider = Provider<LogoutProfileUC>((ref) {
  final casee=ref.read(repoProvider);
  return LogoutProfileUC(casee);
});

final getProfileCaseProvider = Provider<GetProfileUseCase>((ref) {
  final casee = ref.read(repoProvider);
  return GetProfileUseCase(casee);
});
