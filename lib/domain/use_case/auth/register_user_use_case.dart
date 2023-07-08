import 'package:edspert_flutter_final_project_elearning/domain/repository/auth_repository.dart';

import '../../../data/model/user_registration_request.dart';

class RegisterUserUseCase {
  final AuthRepository repository;

  RegisterUserUseCase({required this.repository});

  Future<bool> call(UserRegistrationRequest userBody) async => await repository.registerUser(userBody: userBody);
}