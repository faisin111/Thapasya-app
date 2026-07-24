import 'package:thapasya/apps/student/features/attendance/data/models/break_down_model.dart';

class AttendanceState {
  final bool loading;
  final bool success;
  final String? error;
  final List<BreakDownModel> monthly;
  final Map<DateTime, String> attendance;
  AttendanceState({
    this.loading = false,
    this.success = false,
    this.error,
    this.attendance = const {},
    this.monthly = const [],
  });

  AttendanceState copyWithin({
    bool? loading,
    bool? success,
    String? error,
    List<BreakDownModel>? monthly,
    Map<DateTime,String>? attendance
  }) {
    return AttendanceState(
      loading: loading ?? this.loading,
      success: success ?? this.success,
      error: error ?? this.error,
      monthly: monthly ?? this.monthly,
      attendance: attendance??this.attendance
    );
  }
}
