import 'package:get/get.dart';

import '../../../domain/service/firebase_auth_service.dart';
import '../../../domain/use_case/auth/get_user_by_email_use_case.dart';
import '../../../routes/routes.dart';

class ProfileController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final GetUserByEmailUseCase getUserByEmailUseCase;

  ProfileController({
    required this.firebaseAuthService,
    required this.getUserByEmailUseCase
  });

/*
  @override
  void onInit() async {
    super.onInit();
  }
*/

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    Get.offAllNamed(Routes.login);
  }
}