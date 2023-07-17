import 'package:flutter/foundation.dart';

import '../../../core/constants/urls.dart';
import '../../../domain/service/dio_client.dart';
import '../../model/user.dart';
import '../../model/user_registration_request.dart';
import '../../model/user_response.dart';

class AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSource({required this.dioClient});

  Future<User?> getUserByEmail({required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.users,
        queryParameters: {"email": email},
      );

      UserResponse res = UserResponse.fromJson(result);

      /*
      if ((res.message ?? '').contains('user tidak di temukan')) {
        return null;
      }
      */
      if ((res.status ?? 0) == 0) {
        return null;
      }
      return res.data;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getUserByEmail: $e, $stackTrace');
      }
      return null;
    }
  }

  Future<bool> registerUser({required UserRegistrationRequest userBody}) async {
    try {
      await dioClient.post(Urls.userRegister, body: userBody.toMap());
      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err registerUser: $e, $stackTrace');
      }
      return false;
    }
  }

  Future<User?> updateUserByEmail({required UserRegistrationRequest userBody}) async {
    try {
      final result = await dioClient.post(
        Urls.userUpdate,
        body: userBody.toMap(),
      );

      UserResponse res = UserResponse.fromJson(result);

      if ((res.status ?? 0) == 0) {
        return null;
      }
      return res.data;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err updateUserByEmail: $e, $stackTrace');
      }
      return null;
    }
  }
}