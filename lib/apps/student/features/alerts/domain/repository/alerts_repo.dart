import 'package:thapasya/apps/student/features/alerts/data/models/notification_model.dart';

abstract class AlertsRepo {
  Future<List<NotificationModel>> alerts();
}