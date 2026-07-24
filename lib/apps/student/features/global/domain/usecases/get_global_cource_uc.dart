import 'package:thapasya/apps/student/features/global/data/model/cource_model.dart';
import 'package:thapasya/apps/student/features/global/domain/repository/global_repo.dart';
import 'package:thapasya/apps/student/features/home/domain/repository/home_repo.dart';

class GetGlobalCourceUc {
  final GlobalRepo repo;
  GetGlobalCourceUc(this.repo);

  Future<List< CourceModel>> call()async{
    return repo.getAllCources();
  }
}