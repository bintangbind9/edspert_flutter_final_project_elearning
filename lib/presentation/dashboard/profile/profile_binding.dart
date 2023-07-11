import 'package:get/get.dart';

import '../../../data/service/firebase_auth_service_impl.dart';
import '../../../domain/service/firebase_auth_service.dart';
import 'profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<ProfileController>(() => ProfileController(
          firebaseAuthService: Get.find<FirebaseAuthService>(),
        ));
  }
}