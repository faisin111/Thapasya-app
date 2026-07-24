

import 'package:thapasya/apps/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.username, required super.password});
    Map<String, dynamic> toMap() {
    return {"username": username, "password": password};
  }
} 