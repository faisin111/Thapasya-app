import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thapasya/apps/student/features/alerts/data/datasource/alerts_remote_ds.dart';
import 'package:thapasya/apps/student/features/alerts/data/repository/alerts_impl.dart';
import 'package:thapasya/apps/student/features/alerts/domain/repository/alerts_repo.dart';
import 'package:thapasya/apps/student/features/global/data/datasource/global_remote_ds.dart';
import 'package:thapasya/apps/student/features/global/data/repository/global_impl.dart';
import 'package:thapasya/apps/student/features/global/domain/repository/global_repo.dart';
import 'package:thapasya/apps/student/features/global/domain/usecases/get_global_atten_uc.dart';
import 'package:thapasya/apps/student/features/global/domain/usecases/get_global_cource_uc.dart';

import 'package:thapasya/apps/student/features/home/data/datasource/home_remote_ds.dart';
import 'package:thapasya/apps/student/features/home/data/repository/home_impl.dart';
import 'package:thapasya/apps/student/features/home/domain/repository/home_repo.dart';

import 'package:thapasya/core/di/main_di.dart';

final remoteAlertsProvider = Provider<AlertsRemoteDs>((ref) {
  final client = ref.read(dioProvider);
  return AlertsRemoteDs(client);
});

final repoAlertsProvider = Provider<AlertsRepo>((ref) {
  final r = ref.read(remoteAlertsProvider);

  return AlertsImpl(r);
});




