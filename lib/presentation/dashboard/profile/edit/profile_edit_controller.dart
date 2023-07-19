import 'package:edspert_flutter_final_project_elearning/core/constants/general_values.dart';
import 'package:edspert_flutter_final_project_elearning/presentation/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/model/user.dart';
import '../../../../data/model/user_registration_request.dart';
import '../../../../domain/use_case/auth/update_user_by_email_use_case.dart';

class ProfileEditController extends GetxController {
  final UpdateUserByEmailUseCase updateUserByEmailUseCase;

  ProfileEditController({required this.updateUserByEmailUseCase});

  final TextEditingController fullNameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController etGender = TextEditingController();
  final TextEditingController schoolGradeTextController =
      TextEditingController();
  final TextEditingController schoolNameTextController =
      TextEditingController();

  final _selectedGender = Rx<bool?>(null);

  bool? get selectedGender => _selectedGender.value;

  late User args;

  bool isUpdateUserLoading = false;
  final DashboardController dashboardController = Get.find<DashboardController>();

  @override
  void onInit() {
    args = Get.arguments as User;
    fullNameTextController.text = args.userName ?? '';
    emailTextController.text = args.userEmail ?? '';
    etGender.text = args.userGender ?? '';
    schoolGradeTextController.text = args.kelas ?? '';
    schoolNameTextController.text = args.userAsalSekolah ?? '';

    super.onInit();
  }

  void onSelectedGender({
    required bool value,
    Function? onSelected,
  }) {
    _selectedGender.value = value;
    etGender.text = (value) ? GeneralValues.genderM : GeneralValues.genderF;
    onSelected?.call();
  }

  Future<void> updateData(UserRegistrationRequest userBody) async {
    isUpdateUserLoading = true;
    update();

    User? updatedUser = await updateUserByEmailUseCase.call(userBody: userBody);

    isUpdateUserLoading = false;
    update();

    if (updatedUser != null) {
      dashboardController.updateUser(updatedUser);
      Get.snackbar('Success', 'Data Kamu berhasil diupdate.',
          colorText: AppColors.grayscaleOffWhite,
          backgroundColor: AppColors.success);
    } else {
      Get.snackbar('Failed!', 'Data Kamu tidak berhasil diupdate.',
          colorText: AppColors.grayscaleOffWhite,
          backgroundColor: AppColors.error);
    }
  }
}