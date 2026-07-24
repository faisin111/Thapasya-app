import 'package:thapasya/apps/student/features/home/data/model/dashboard_model.dart';
import 'package:thapasya/apps/student/features/home/domain/repository/home_repo.dart';

class GetHomeDshUc {
  final HomeRepo repo;
  GetHomeDshUc(this.repo);
  Future<DashboardModel> call(int id)async{
    return repo.getDasboardById(id);
  }
}