import 'package:intl/intl.dart';

class AttendanceUtil {
  static double percentage({required int total, required int precent}) {
    if (total == 0) return 0;
    return (precent / total) * 100;
  }

 static String getMonth(String date) {
    DateTime h = DateTime.parse(date);
    return DateFormat.MMMM().format(h);
  }

 static DateTime getDate(String date) {
    DateTime d = DateTime.parse(date);

    return d;
  }
}
