import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thapasya/apps/student/features/global/data/datasource/global_remote_ds.dart';
import 'package:thapasya/apps/student/features/global/data/repository/global_impl.dart';
import 'package:thapasya/apps/student/features/global/domain/repository/global_repo.dart';
import 'package:thapasya/apps/student/features/global/domain/usecases/get_global_atten_uc.dart';
import 'package:thapasya/apps/student/features/global/domain/usecases/get_global_cource_uc.dart';

import 'package:thapasya/apps/student/features/home/data/datasource/home_remote_ds.dart';
import 'package:thapasya/apps/student/features/home/data/repository/home_impl.dart';
import 'package:thapasya/apps/student/features/home/domain/repository/home_repo.dart';

import 'package:thapasya/core/di/main_di.dart';

final remoteGlobalProvider = Provider<GlobalRemoteDs>((ref) {
  final client = ref.read(dioProvider);
  return GlobalRemoteDs(client);
});

final repoGlobalProvider = Provider<GlobalRepo>((ref) {
  final r = ref.read(remoteGlobalProvider);

  return GlobalImpl(r);
});

final getGlobalCourceProvide=Provider((ref){
   final casee=ref.read(repoGlobalProvider);
  return GetGlobalCourceUc(casee);
});

final attenGlobalCProvider = Provider<GetGlobalAttenUc>((ref) {
  final casee=ref.read(repoGlobalProvider);
  return GetGlobalAttenUc(casee);
});

// final getProfileCaseProvider = Provider<GetProfileUseCase>((ref) {
//   final casee = ref.read(repoProvider);
//   return GetProfileUseCase(casee);
// });
