import 'package:flutter_riverpod/legacy.dart';
import 'package:thapasya/apps/student/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:thapasya/apps/student/features/profile/domain/usecases/logout_profile_u_c.dart';
import 'package:thapasya/apps/student/features/profile/presentation/state/profile_sate.dart';
import 'package:thapasya/core/error/exception.dart';

class ProfileController extends StateNotifier<ProfileSate> {
  final GetProfileUseCase profile;
  final LogoutProfileUC logout;
  ProfileController(this.profile, this.logout) : super(ProfileSate());
  Future<void> logoutAcc() async {
    state = state.copyWithin(loading: true, success: false);
    try {
      await logout.call();

      state = state.copyWithin(loading: false, success: true);
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
