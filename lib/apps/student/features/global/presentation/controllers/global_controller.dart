import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/student/features/global/domain/usecases/get_global_atten_uc.dart';
import 'package:thapasya/apps/student/features/global/domain/usecases/get_global_cource_uc.dart';
import 'package:thapasya/apps/student/features/global/presentation/providers/global_providers.dart';
import 'package:thapasya/apps/student/features/global/presentation/state/global_state.dart';
import 'package:thapasya/core/di/student/global_di.dart';
import 'package:thapasya/core/error/exception.dart';
import 'package:thapasya/core/utils/attendance_util.dart';

class GlobalController extends StateNotifier<GlobalState> {
  final Ref ref;
  GlobalController(this.ref) : super(GlobalState());

  Future<void> getCources() async {
    final GetGlobalCourceUc cource = ref.read(getGlobalCourceProvide);
    state = state.copyWithin(loading: true, success: false);
    try {
      final c = await cource.call();

      state = state.copyWithin(success: true, loading: false, cources: c);
    } on ApiException catch (e) {
      state = state.copyWithin(
        error: e.message,
        success: false,
        loading: false,
      );
    } catch (e) {
      state = state.copyWithin(
        error: e.toString(),
        success: false,
        loading: false,
      );
    }
  }

  Future<void> getAttendance(int id) async {
    final GetGlobalAttenUc attendance = ref.read(attenGlobalCProvider);
    state = state.copyWithin(loading: true, success: false);
    try {
      final c = await attendance.call(id);
      int presents = 0;
      for (var i in c.history) {
        if (i.status == "present") {
          presents++;
        }
      }
      state = state.copyWithin(
        success: true,
        loading: false,
        attendance: c,
        presentDays: presents,
        percentage: AttendanceUtil.percentage(
          total: c.history.length,
          precent: presents,
        ),
      );
    } on ApiException catch (e) {
      state = state.copyWithin(
        error: e.message,
        success: false,
        loading: false,
      );
    } catch (e) {
      state = state.copyWithin(
        error: e.toString(),
        success: false,
        loading: false,
      );
    }
  }
}
