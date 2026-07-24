import 'package:thapasya/apps/student/features/profile/domain/entity/parent_entity.dart';

class ParentModel extends ParentEntity {
  ParentModel({
    required super.name,
    required super.phone,
    required super.email,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
    );
  }
}
