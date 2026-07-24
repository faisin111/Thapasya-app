import 'package:thapasya/apps/student/features/profile/domain/repository/profile_repo.dart';

class LogoutProfileUC {
  final ProfileRepo repo;
  LogoutProfileUC(this.repo);

  Future<String> call() async {
    return repo.logout();
  }
}
