import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/student/features/global/domain/usecases/get_global_atten_uc.dart';
import 'package:thapasya/apps/student/features/global/presentation/controllers/global_controller.dart';
import 'package:thapasya/apps/student/features/global/domain/usecases/get_global_cource_uc.dart';
import 'package:thapasya/apps/student/features/global/presentation/providers/global_providers.dart';
import 'package:thapasya/apps/student/features/home/domain/usecses/get_home_dsh_uc.dart';
import 'package:thapasya/apps/student/features/home/presentation/providers/home_provider.dart';
import 'package:thapasya/apps/student/features/home/presentation/state/home_state.dart';
import 'package:thapasya/core/error/exception.dart';

class HomeController extends StateNotifier<HomeState> {
  final GetHomeDshUc dsh;

  final Ref ref;
  HomeController(this.ref, this.dsh) : super(HomeState());

  Future<void> getDash({int? id, String? name}) async {
    state = state.copyWithin(loading: true, success: false);
    debugPrint("dashboard called");
    try {
      if (ref.read(globalProvider).cources.isEmpty) {
        state = state.copyWithin(loading: false, success: true);
        return;
      }
      final idd = ref.read(globalProvider).cources[0].id;
      final c = await dsh.call(id ?? idd);
      ref.read(globalCourceProvider.notifier).state =
          name ?? ref.read(globalProvider).cources[0].name;
      await ref.read(globalProvider.notifier).getAttendance(id ?? idd);
      state = state.copyWithin(loading: false, success: true, dshData: c);
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
