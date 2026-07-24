import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/student/features/global/presentation/controllers/global_controller.dart';
import 'package:thapasya/apps/student/features/global/presentation/providers/global_providers.dart';
import 'package:thapasya/apps/student/features/global/domain/usecases/get_global_cource_uc.dart';
import 'package:thapasya/apps/student/features/home/domain/usecses/get_home_dsh_uc.dart';
import 'package:thapasya/apps/student/features/home/presentation/controller/home_controller.dart';
import 'package:thapasya/apps/student/features/home/presentation/state/home_state.dart';
import 'package:thapasya/core/di/student/home_di.dart';

final homeProvider =
    StateNotifierProvider.autoDispose<HomeController, HomeState>((ref) {
      final h = ref.read(repoHomeProvider);
      return HomeController(ref, GetHomeDshUc(h));
    });

final globalCourceProvider = StateProvider<String>((ref) {
  return "unknown";
});

final logsTappProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});