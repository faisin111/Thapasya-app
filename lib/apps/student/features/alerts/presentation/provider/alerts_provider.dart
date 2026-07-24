import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/student/features/alerts/domain/usecases/get_all_alerts_uc.dart';
import 'package:thapasya/apps/student/features/alerts/presentation/controller/alerts_controller.dart';
import 'package:thapasya/apps/student/features/alerts/presentation/state/alerts_state.dart';
import 'package:thapasya/core/di/student/alerts.dart';

final alertsProvider = StateNotifierProvider<AlertsController, AlertsState>((
  ref,
) {
  final r = ref.read(repoAlertsProvider);
  return AlertsController(GetAllAlertsUc(r));
});
