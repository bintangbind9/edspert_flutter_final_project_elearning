import 'package:get/get.dart';

import '../../../data/model/user.dart';
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

  Rx<User> currentUser = (User()).obs;

  @override
  void onInit() async {
    super.onInit();

    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      User? user = await getUserByEmailUseCase.call(email: email);
      if (user != null) {
        currentUser(user);
      } else {
        Get.offAllNamed(Routes.registerForm);
      }
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    Get.offAllNamed(Routes.login);
  }
}