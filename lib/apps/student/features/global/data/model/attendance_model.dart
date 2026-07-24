import 'package:thapasya/apps/student/features/global/data/model/history_model.dart';
import 'package:thapasya/apps/student/features/global/domain/entity/attentance_entity.dart';

class AttendanceModel extends AttentanceEntity {
  AttendanceModel({required super.id, required super.history});

  factory AttendanceModel.fromJson(Map<String,dynamic> json){
    final h=(json["history"] as List).map((e)=>HistoryModel.fromJson(e)).toList();
    return AttendanceModel(id: json["course_id"], history: h);
  }
}