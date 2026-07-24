import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';
import 'package:thapasya/apps/student/features/alerts/data/models/notification_model.dart';
import 'package:thapasya/apps/student/features/attendance/data/models/break_down_model.dart';
import 'package:thapasya/apps/student/features/global/data/model/history_model.dart';

class AttendanceService {
  static List<BreakDownModel> groupByMonth(List<HistoryModel> history) {
    final Map<String, BreakDownModel> map = {};

    for (final item in history) {
      final month = DateFormat('MMMM yyyy').format(DateTime.parse(item.date));

      if (map.containsKey(month)) {
        final current = map[month]!;

        map[month] = current.copyWithin(
          totalDays: current.totalDays + 1,
          presentDays:
              current.presentDays +
              (item.status == "present" || item.status == "late" ? 1 : 0),
        );
      } else {
        map[month] = BreakDownModel(
          month: month,
          totalDays: 1,
          presentDays: item.status == "present" || item.status == "late"
              ? 1
              : 0,
        );
      }
    }

    return map.values.toList();
  }

  static Map<DateTime, String> getMonthlyAtten(List<HistoryModel> models) {
    Map<DateTime, String> items = {};

    for (var i in models) {
      final day = DateTime.parse(i.date);

      items[DateTime(day.year, day.month, day.day)] = i.status;
    }
    return items;
  }

  static List<NotificationModel> getTimeAgo(List<NotificationModel> models) {
    return models.map((e) {
      final date = DateTime.parse(e.createdAt);
      final time = timeago.format(date);
      return e = e.copyWithin(time: time);
    }).toList();
  }
}
