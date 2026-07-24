import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thapasya/apps/student/features/home/data/datasource/home_remote_ds.dart';
import 'package:thapasya/apps/student/features/home/data/repository/home_impl.dart';
import 'package:thapasya/apps/student/features/home/domain/repository/home_repo.dart';

import 'package:thapasya/core/di/main_di.dart';

final remoteHomeProvider = Provider<HomeRemoteDs>((ref) {
  final client = ref.read(dioProvider);
  return HomeRemoteDs(client);
});

final repoHomeProvider = Provider<HomeRepo>((ref) {
  final r = ref.read(remoteHomeProvider);

  return HomeImpl(r);
});

// final logoutProfileCProvider = Provider<LogoutProfileUC>((ref) {
//   final casee=ref.read(repoProvider);
//   return LogoutProfileUC(casee);
// });

// final getProfileCaseProvider = Provider<GetProfileUseCase>((ref) {
//   final casee = ref.read(repoProvider);
//   return GetProfileUseCase(casee);
// });
