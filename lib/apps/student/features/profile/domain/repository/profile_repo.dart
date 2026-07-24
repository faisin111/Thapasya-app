import 'package:thapasya/apps/student/features/profile/data/model/user_model.dart';

abstract class ProfileRepo {
  Future<ProfileModel> getProfile();
  Future<String> logout();
}
