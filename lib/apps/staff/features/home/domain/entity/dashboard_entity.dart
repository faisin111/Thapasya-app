import 'package:thapasya/apps/student/features/home/data/model/log_model.dart';

class DashboardEntity {
  final String? greeting;
  final String? name;
  final List<dynamic>? shedules;
  final List<LogModel>? recentLogs;
  DashboardEntity({
    required this.greeting,
    required this.name,
    required this.shedules,
    required this.recentLogs,
  });
}
