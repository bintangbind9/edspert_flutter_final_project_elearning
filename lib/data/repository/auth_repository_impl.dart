import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/user.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/user_registration_request.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<User?> getUserByEmail({required String email}) async =>
      await authRemoteDataSource.getUserByEmail(email: email);

  @override
  Future<bool> registerUser(
          {required UserRegistrationRequest userBody}) async =>
      await authRemoteDataSource.registerUser(userBody: userBody);

  @override
  Future<User?> updateUserByEmail({required UserRegistrationRequest userBody}) async =>
      await authRemoteDataSource.updateUserByEmail(userBody: userBody);
}