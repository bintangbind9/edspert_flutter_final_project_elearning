import '../../data/model/user.dart';
import '../../data/model/user_registration_request.dart';

abstract class AuthRepository {
  Future<User?> getUserByEmail({required String email});
  Future<bool> registerUser({required UserRegistrationRequest userBody});
}