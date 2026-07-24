import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thapasya/apps/features/landing/data/data_source/local_ds.dart';

import 'package:thapasya/core/di/main_di.dart';

final localDsProvider = Provider<LocalDs>((ref) {
  final p = ref.read(prefsProvider);
  return LocalDs(p);
});
final checkAuthProvider = FutureProvider<Map<String, dynamic>>((
  ref,
) async {
  final c = ref.read(localDsProvider);
  final r = await c.getRole();
  final l = await c.getLogging();
  return {"role": r, "logging": l};
});
