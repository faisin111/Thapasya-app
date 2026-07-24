import 'package:thapasya/apps/student/features/global/domain/entity/history_entity.dart';

class HistoryModel extends HistoryEntity{
  HistoryModel({required super.date, required super.status});
    factory HistoryModel.fromJson(Map<String,dynamic> json){
    return HistoryModel(date: json["date"], status: json["status"]);
  }
}