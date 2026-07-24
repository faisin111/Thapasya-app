import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/student/features/attendance/data/models/break_down_model.dart';
import 'package:thapasya/apps/student/features/attendance/presentation/state/attendance_state.dart';
import 'package:thapasya/apps/student/features/global/presentation/providers/global_providers.dart';
import 'package:thapasya/core/service/attendance_service.dart';
import 'package:thapasya/core/utils/attendance_util.dart';

class AttendanceController extends StateNotifier<AttendanceState> {
  final Ref ref;
  AttendanceController(this.ref) : super(AttendanceState());

  void getMonthlyDetails() {
    state = state.copyWithin(loading: true, success: false);
    final attende = ref.read(globalProvider).attendance?.history;
    if (attende == null) {
      state = state.copyWithin(loading: false, success: false);
      return;
    }
    final breakdowns = AttendanceService.groupByMonth(attende);
    state = state.copyWithin(
      loading: false,
      success: false,
      monthly: breakdowns,
    );
  }

  void getMonthlyAtt() {
    // state = state.copyWithin(loading: true, success: false);
    final attende = ref.read(globalProvider).attendance?.history;
    if (attende == null) {
      state = state.copyWithin(loading: false, success: true);
      return;
    }
    final attt = AttendanceService.getMonthlyAtten(attende);
    state = state.copyWithin(loading: false, success: true, attendance: attt);
  }
}
