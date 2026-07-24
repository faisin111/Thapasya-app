import 'package:thapasya/apps/student/features/alerts/data/models/notification_model.dart';
import 'package:thapasya/apps/student/features/alerts/domain/repository/alerts_repo.dart';

class GetAllAlertsUc {
  final AlertsRepo repo;
  GetAllAlertsUc(this.repo);

  Future<List<NotificationModel>> call()async{
    return repo.alerts();
  }
}