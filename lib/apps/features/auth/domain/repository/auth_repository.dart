

import 'package:thapasya/apps/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<String> login(UserModel model);
   
}