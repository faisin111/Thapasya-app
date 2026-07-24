import 'package:thapasya/apps/student/features/home/data/datasource/home_remote_ds.dart';
import 'package:thapasya/apps/student/features/global/data/model/cource_model.dart';
import 'package:thapasya/apps/student/features/home/data/model/dashboard_model.dart';
import 'package:thapasya/apps/student/features/home/domain/repository/home_repo.dart';

class HomeImpl implements HomeRepo{
  final HomeRemoteDs remote;
  HomeImpl(this.remote);
 

  @override
  Future<DashboardModel> getDasboardById(int id) async{
    return remote.getDsh(id);
  }
}