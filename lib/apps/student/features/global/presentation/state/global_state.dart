import 'package:thapasya/apps/student/features/global/data/model/attendance_model.dart';
import 'package:thapasya/apps/student/features/global/data/model/cource_model.dart';
import 'package:thapasya/apps/student/features/profile/data/model/user_model.dart';

class GlobalState {
  final bool loading;
  final bool success;
  final String? error;
  final AttendanceModel? attendance;
  final int presentDays;
  
  final double percentage;
  final List<CourceModel> cources;
  GlobalState({
    this.loading = false,
    this.success = false,
    this.presentDays = 0,
    this.error,
    this.attendance,
    this.percentage = 0,
    this.cources = const [],
  });

  GlobalState copyWithin({
    bool? loading,
    bool? success,
    String? error,
    AttendanceModel? attendance,
    int? presentDays,
    double? percentage,
    List<CourceModel>? cources,
  }) {
    return GlobalState(
      loading: loading ?? this.loading,
      success: success ?? this.success,
      error: error ?? this.error,
      attendance: attendance ?? this.attendance,
      presentDays: presentDays ?? this.presentDays,
      percentage: percentage ?? this.percentage,
      cources: cources ?? this.cources,
    );
  }
}
