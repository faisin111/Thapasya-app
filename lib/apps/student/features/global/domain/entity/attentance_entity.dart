import 'package:thapasya/apps/student/features/global/data/model/history_model.dart';

class AttentanceEntity {
  final int id;
  final List<HistoryModel> history;
  AttentanceEntity({required this.id, required this.history});
}
