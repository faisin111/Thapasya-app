import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/student/features/global/presentation/controllers/global_controller.dart';
import 'package:thapasya/apps/student/features/global/presentation/state/global_state.dart';

final globalProvider = StateNotifierProvider<GlobalController, GlobalState>((
  ref,
) {
  return GlobalController(ref);
});
