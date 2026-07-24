import 'package:thapasya/apps/student/features/attendance/domain/entity/break_down_entity.dart';

class BreakDownModel extends BreakDownEntity {
  BreakDownModel({
    required super.month,
    required super.totalDays,
    required super.presentDays,

  });

  BreakDownModel copyWithin({
    String? month,
    int? totalDays,
    int? presentDays,

  }) {
    return BreakDownModel(
      month: month ?? this.month,
      totalDays: totalDays ?? this.totalDays,
      presentDays: presentDays ?? this.presentDays,
   
    );
  }
}
