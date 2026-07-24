import 'package:thapasya/apps/student/features/profile/data/model/user_model.dart';

class ProfileSate {
  final bool loading;
  final bool success;
  final String? error;
  final ProfileModel? model;
  ProfileSate({
    this.loading = false,
    this.success = false,
    this.error,
    this.model,
  });

  ProfileSate copyWithin({
    bool? loading,
    bool? success,
    String? error,
    ProfileModel? model,
  }) {
    return ProfileSate(
      loading: loading ?? this.loading,
      success: success ?? this.success,
      error: error ?? this.error,
      model: model ?? this.model,
    );
  }
}
