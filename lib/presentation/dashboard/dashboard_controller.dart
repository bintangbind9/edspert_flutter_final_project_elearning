import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../data/model/user.dart';
import '../../domain/service/firebase_auth_service.dart';
import '../../domain/use_case/auth/get_user_by_email_use_case.dart';

class DashboardController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final GetUserByEmailUseCase getUserByEmailUseCase;

  DashboardController({required this.firebaseAuthService, required this.getUserByEmailUseCase});

  final selectedNavIndexObs = 0.obs;
  // int selectedNavIndex = 0;

  void navigateTo(int index) {
    // Obs
    selectedNavIndexObs.value = index;

    // // Set-update
    // selectedNavIndex = index;
    // update();
  }

  bool isOnline = true;

  User? currentUser;

  @override
  void onInit() async {
    super.onInit();

    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      User? user = await getUserByEmailUseCase.call(email: email);
      if (user != null) {
        currentUser = user;
        update();
      }
    }

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print('result: $result');
      isOnline = !(result == ConnectivityResult.bluetooth ||
          result == ConnectivityResult.none);
      update();
    });
  }

  updateUser (User user) {
    currentUser = user;
    update();
  }
}