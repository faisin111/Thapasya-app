import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/student/features/attendance/presentation/controller/attendance_controller.dart';
import 'package:thapasya/apps/student/features/attendance/presentation/state/attendance_state.dart';

final attendanceProvider = StateNotifierProvider<AttendanceController,AttendanceState>((ref) {
  return AttendanceController(ref);
});

final focusedDayProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});