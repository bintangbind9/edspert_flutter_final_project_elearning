import 'dart:async';

import 'package:edspert_flutter_final_project_elearning/domain/use_case/auth/get_user_by_email_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../domain/service/firebase_auth_service.dart';
import '../../../routes/routes.dart';
import '../../../data/model/user.dart' as user_model;

class LoginController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final GetUserByEmailUseCase getUserByEmailUseCase;

  LoginController({required this.firebaseAuthService, required this.getUserByEmailUseCase});

  /// Steps:
  /// 1. Sign In With Google
  /// 2. Get Email from UserCredential
  /// 3. Check isUserRegistered()
  Future<void> onGoogleSignIn() async {
    User? user = await firebaseAuthService.signInWithGoogle();
    if (user != null) {
      await isUserRegistered();
    }
  }

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    Get.offAllNamed(Routes.login);
  }

  Future<void> isUserRegistered() async {
    String? email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) {
      user_model.User? user = await getUserByEmailUseCase.call(email: email);
      if (user != null) {
        // User is Registered
        Get.offAllNamed(Routes.dashboard);
      } else {
        // User is Signed In & Is not Registered
        Get.offAllNamed(Routes.registerForm);
      }
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}