import 'package:thapasya/apps/student/features/home/domain/entity/log_entity.dart';

class LogModel extends LogEntity {
  LogModel({required super.title, required super.summary, required super.date});
  factory LogModel.fromJson(Map<String, dynamic> json) {
    return LogModel(
      title: json["title"],
      summary: json["summary"],
      date: json["date"],
    );
  }
}
