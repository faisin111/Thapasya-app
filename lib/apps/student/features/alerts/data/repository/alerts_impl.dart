import 'package:flutter/foundation.dart';
import 'package:thapasya/apps/student/features/alerts/data/datasource/alerts_remote_ds.dart';
import 'package:thapasya/apps/student/features/alerts/data/models/notification_model.dart';
import 'package:thapasya/apps/student/features/alerts/domain/repository/alerts_repo.dart';

class AlertsImpl implements AlertsRepo {
  final AlertsRemoteDs remote;
  AlertsImpl(this.remote);
  @override
  Future<List<NotificationModel>> alerts()async {
    debugPrint("repo called");
   return remote.getAllAlerts();
  }
} 