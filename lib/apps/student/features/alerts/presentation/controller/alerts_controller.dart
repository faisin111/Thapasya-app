import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/student/features/alerts/data/models/notification_model.dart';
import 'package:thapasya/apps/student/features/alerts/domain/usecases/get_all_alerts_uc.dart';
import 'package:thapasya/apps/student/features/alerts/presentation/state/alerts_state.dart';
import 'package:thapasya/core/error/exception.dart';
import 'package:thapasya/core/service/attendance_service.dart';
import 'package:thapasya/core/utils/attendance_util.dart';

class AlertsController extends StateNotifier<AlertsState> {
  final GetAllAlertsUc alerts;
  AlertsController(this.alerts) : super(AlertsState());

  Future<void> getALerts() async {
    state = state.copyWithin(loading: true, success: false);
    try {
      final data = await alerts.call();
      final items = AttendanceService.getTimeAgo(data);
      Set<String> t = data.map((e) => e.type).toSet();
      state = state.copyWithin(
        loading: false,
        success: true,
        alerts: items,
        types: t.toList(),
        filtered: items,
      );
    } on ApiException catch (e) {
      state = state.copyWithin(
        loading: false,
        success: false,
        error: e.message,
      );
    } catch (e) {
      state = state.copyWithin(
        loading: false,
        success: false,
        error: e.toString(),
      );
    }
  }

  void getFiltered(String f) async {
    state = state.copyWithin(loading: true, success: false);

    List<NotificationModel> items = state.alerts
        .where((e) => e.type == f)
        .toList();
    state = state.copyWithin(loading: false, success: true, filtered: items);
  }
}
