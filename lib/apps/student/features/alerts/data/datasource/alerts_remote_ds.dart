import 'package:dio/dio.dart';
import 'package:thapasya/apps/student/features/alerts/data/models/notification_model.dart';
import 'package:thapasya/core/api/api_endpoints.dart';
import 'package:thapasya/core/api/dio_client.dart';
import 'package:thapasya/core/error/error_handler.dart';
import 'package:thapasya/core/error/exception.dart';

class AlertsRemoteDs {
  final DioClient client;
  AlertsRemoteDs(this.client);

  Future<List<NotificationModel>> getAllAlerts() async {
    try {
      final response = await client.dio.get(ApiEndpoints.alerts);
      return (response.data as List)
          .map((e) => NotificationModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw ErrorHandler.handlerData(e);
    } catch (e) {
      throw ApiException(e.toString());
    }
  }
}
