import 'package:edspert_flutter_final_project_elearning/domain/repository/auth_repository.dart';

import '../../../data/model/user.dart';

class GetUserByEmailUseCase {
  final AuthRepository repository;

  GetUserByEmailUseCase({required this.repository});

  Future<User?> call(String email) async => await repository.getUserByEmail(email: email);
}