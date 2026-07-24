import 'package:thapasya/apps/student/features/global/data/model/cource_model.dart';
import 'package:thapasya/apps/student/features/home/data/model/dashboard_model.dart';

abstract class HomeRepo {
 
  Future<DashboardModel> getDasboardById(int id);
}