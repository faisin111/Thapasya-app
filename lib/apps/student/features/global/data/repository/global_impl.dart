import 'package:thapasya/apps/student/features/global/data/datasource/global_remote_ds.dart';
import 'package:thapasya/apps/student/features/global/data/model/attendance_model.dart';
import 'package:thapasya/apps/student/features/global/data/model/cource_model.dart';
import 'package:thapasya/apps/student/features/global/domain/repository/global_repo.dart';

class GlobalImpl implements GlobalRepo {
  final GlobalRemoteDs remote;
  GlobalImpl(this.remote);

   @override
  Future<List< CourceModel>> getAllCources()async {
   return remote.getCource();
  }
  @override
  Future<AttendanceModel> getAttendance(int id)async {
    return remote.getAttendance(id);
  }
}