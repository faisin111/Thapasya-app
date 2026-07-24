import 'package:thapasya/apps/student/features/profile/data/data_source/profile_local_ds.dart';
import 'package:thapasya/apps/student/features/profile/data/data_source/profile_remote_ds.dart';
import 'package:thapasya/apps/student/features/profile/data/model/user_model.dart';
import 'package:thapasya/apps/student/features/profile/domain/repository/profile_repo.dart';
import 'package:thapasya/core/error/exception.dart';

class ProfileImpl implements ProfileRepo {
  final ProfileRemoteDs remote;
  final ProfileLocalDs local;
  ProfileImpl(this.remote, this.local);
  @override
  Future<ProfileModel> getProfile() async {
    return remote.getProfile();
  }

  @override
  Future<String> logout() async {
    try {
      await local.remove();
      final d = await remote.logout();
      return d;
    } on ApiException catch (e) {
      throw ApiException(e.message);
    } catch (e) {
      throw ApiException(e.toString());
    }
  }
}
