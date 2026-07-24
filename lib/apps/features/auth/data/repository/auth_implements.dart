
import 'package:thapasya/apps/features/auth/data/data_source/auth_local_ds.dart';
import 'package:thapasya/apps/features/auth/data/data_source/auth_remote_ds.dart';
import 'package:thapasya/apps/features/auth/data/models/user_model.dart';
import 'package:thapasya/apps/features/auth/domain/repository/auth_repository.dart';
import 'package:thapasya/core/error/exception.dart';

class AuthImplements implements AuthRepository {
  final AuthRemoteDs remote;
  final AuthLocalDs local;
  AuthImplements(this.remote, this.local);
  @override
  Future<String> login(UserModel model) async {
    try {
      final data = await remote.loginPost(model);
      await local.setRole(data);
      await local.setLogging(true);
      return data;
    } on ApiException catch (e) {
      throw ApiException(e.message);
    } catch (e) {
      throw ApiException(e.toString());
    }
  }
}
