import 'package:thapasya/apps/student/features/global/data/model/attendance_model.dart';
import 'package:thapasya/apps/student/features/global/data/model/cource_model.dart';

abstract class GlobalRepo {
    Future<List< CourceModel>> getAllCources();
  Future<AttendanceModel> getAttendance(int id);
}