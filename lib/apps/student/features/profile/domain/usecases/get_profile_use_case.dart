import 'package:thapasya/apps/student/features/profile/data/model/user_model.dart';
import 'package:thapasya/apps/student/features/profile/domain/repository/profile_repo.dart';

class GetProfileUseCase {
  final ProfileRepo repo;
  GetProfileUseCase(this.repo);

  Future<ProfileModel> call()async{
    return repo.getProfile();
  }
}