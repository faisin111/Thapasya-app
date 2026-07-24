import 'package:thapasya/apps/student/features/global/data/model/cource_model.dart';
import 'package:thapasya/apps/student/features/home/data/model/dashboard_model.dart';

class HomeState {
  final bool loading;
  final bool success;
  final String? error;
 
  final DashboardModel? dshData;
  final double present;
  HomeState({
    this.loading = false,
    this.success = false,
    this.error,
    this.dshData,
    this.present = 0,
  
  });

  HomeState copyWithin({
    bool? loading,
    bool? success,
    String? error,
    double? percentage,
    DashboardModel? dshData,
   
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      success: success ?? this.success,
      error: error ?? this.error,
    
      dshData: dshData ?? this.dshData,
      present: percentage ?? this.present,
    );
  }
}
