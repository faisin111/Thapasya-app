import 'package:thapasya/apps/student/features/alerts/data/models/notification_model.dart';
import 'package:thapasya/apps/student/features/attendance/data/models/break_down_model.dart';

class AlertsState {
  final bool loading;
  final bool success;
  final String? error;
  final List<NotificationModel> alerts;
   final List<String> types;
  final List<NotificationModel> filtered;
  AlertsState({
    this.loading = false,
    this.success = false,
    this.error,
    this.types=const [],
    this.alerts = const [],
    this.filtered = const [],
  });

  AlertsState copyWithin({
    bool? loading,
    bool? success,
    String? error,
    List<NotificationModel>? alerts,
    List<NotificationModel>? filtered,
    List<String>? types
  }) {
    return AlertsState(
      loading: loading ?? this.loading,
      success: success ?? this.success,
      error: error ?? this.error,
      alerts: alerts??this.alerts,
      filtered: filtered??this.filtered,
      types: types??this.types
    );
  }
}
