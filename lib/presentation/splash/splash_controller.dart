import 'package:edspert_flutter_final_project_elearning/domain/use_case/auth/get_user_by_email_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../domain/service/firebase_auth_service.dart';
import '../../routes/routes.dart';
import '../../data/model/user.dart' as user_model;

class SplashController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final GetUserByEmailUseCase getUserByEmailUseCase;

  SplashController({
    required this.firebaseAuthService,
    required this.getUserByEmailUseCase
  });

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 2000)).then((value) async {
      await isUserSignedIn();
    });
  }

  Future<void> isUserSignedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      // User Is Signed In
      // Check is user registered?
      await isUserRegistered();
    } else {
      // User is Not Signed In
      // Navigate to Login Page
      Get.offAllNamed(Routes.login);
    }
  }

  Future<void> isUserRegistered() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    // email != null artinya user sudah sign-in
    if (email != null) {
      user_model.User? user = await getUserByEmailUseCase.call(email: email);
      if (user != null) {
        // User is Registered
        // Navigate to Dashboard Page
        Get.offAllNamed(Routes.dashboard);
      } else {
        // User is Signed In & Is not Registered
        // Navigate to Register Form Page
        Get.offAllNamed(Routes.registerForm);
      }
    } else {
      // User is Not Signed In
      // Navigate to Login Page
      Get.offAllNamed(Routes.login);
    }
  }
}