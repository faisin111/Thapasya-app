import 'package:thapasya/apps/student/features/global/data/model/attendance_model.dart';
import 'package:thapasya/apps/student/features/global/domain/repository/global_repo.dart';

class GetGlobalAttenUc {
  final GlobalRepo repo;
  GetGlobalAttenUc(this.repo);

  Future<AttendanceModel> call(int id)async{
    return repo.getAttendance(id);
  }
}