

import 'package:thapasya/apps/features/auth/data/models/user_model.dart';
import 'package:thapasya/apps/features/auth/domain/repository/auth_repository.dart';

class AuthLoginUseCase {
  final AuthRepository repo;
  AuthLoginUseCase(this.repo);
  Future<String> call(UserModel model)async{
    return repo.login(model);
  }
}