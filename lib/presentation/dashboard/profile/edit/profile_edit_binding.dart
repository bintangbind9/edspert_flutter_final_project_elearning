import 'package:get/get.dart';

import 'profile_edit_controller.dart';

class ProfileEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileEditController());
  }
}