import 'package:edspert_flutter_final_project_elearning/domain/repository/auth_repository.dart';

import '../../../data/model/user.dart';
import '../../../data/model/user_registration_request.dart';

class UpdateUserByEmailUseCase {
  final AuthRepository repository;

  UpdateUserByEmailUseCase({required this.repository});

  Future<User?> call({required UserRegistrationRequest userBody}) async => await repository.updateUserByEmail(userBody: userBody);
}