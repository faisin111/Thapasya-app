import 'package:thapasya/apps/student/features/profile/data/model/parent_model.dart';
import 'package:thapasya/apps/student/features/profile/domain/entity/user_entity.dart';

class ProfileModel extends ProfileEntity {
  final ParentModel parent;
  ProfileModel({
    required super.name,
    required super.phone,
    required super.address,
    required super.email,
    required this.parent,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final model = json["parent"] as Map<String, dynamic>;
    return ProfileModel(
      name: json["name"],
      phone: json["phone"],
      address: json["address"],
      email: json["email"],
      parent: ParentModel(
        name: model["name"],
        phone: model["phone"],
        email: model["email"],
      ),
    );
  }
}
