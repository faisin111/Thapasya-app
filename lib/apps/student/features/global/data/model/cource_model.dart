import 'package:thapasya/apps/student/features/global/domain/entity/cource_entity.dart';

class CourceModel extends CourceEntity {
  CourceModel({required super.id, required super.name});

  factory CourceModel.fromJson(Map<String, dynamic> json) {
    return CourceModel(id: json["id"], name: json["name"]);
  }
}
