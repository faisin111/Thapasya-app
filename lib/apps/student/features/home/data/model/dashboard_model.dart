import 'package:thapasya/apps/student/features/home/data/model/log_model.dart';
import 'package:thapasya/apps/student/features/home/domain/entity/dashboard_entity.dart';

class DashboardModel extends DashboardEntity {
  DashboardModel({
    required super.greeting,
    required super.name,
    required super.shedules,
    required super.recentLogs,
  });
  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    final List<LogModel> logs = (json["recent_logs"] as List)
        .map((e) => LogModel.fromJson(e))
        .toList();
    return DashboardModel(
      greeting: json["user_info"]["greeting"],
      name: json["user_info"]["name"],
      shedules: json["schedules"],
      recentLogs: logs,
    );
  }
}
