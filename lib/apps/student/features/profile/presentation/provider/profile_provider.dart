import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/student/features/profile/data/model/user_model.dart';
import 'package:thapasya/apps/student/features/profile/presentation/controller/profile_controller.dart';
import 'package:thapasya/apps/student/features/profile/presentation/state/profile_sate.dart';
import 'package:thapasya/core/di/student/profile_di.dart';

final profileProvider =
    StateNotifierProvider.autoDispose<ProfileController, ProfileSate>((ref) {
      final r = ref.read(getProfileCaseProvider);
      final l = ref.read(logoutProfileCProvider);
      return ProfileController(r, l);
    });

final getProfileProvider = FutureProvider.autoDispose<ProfileModel>((
  ref,
) async {
  final r = ref.read(getProfileCaseProvider);
  return r.call();
});
