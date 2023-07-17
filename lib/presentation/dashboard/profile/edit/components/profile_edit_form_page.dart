import 'package:edspert_flutter_final_project_elearning/core/constants/general_values.dart';
import 'package:edspert_flutter_final_project_elearning/presentation/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../data/model/user_registration_request.dart';
import '../profile_edit_controller.dart';

class ProfileEditFormPage<C extends ProfileEditController>
    extends GetWidget<C> {
  const ProfileEditFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.isUpdateUserLoading.value) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 26,
        ),
        children: [
          const Text(
            'Data Diri',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: controller.fullNameTextController,
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            readOnly: true,
            controller: controller.emailTextController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            readOnly: true,
            controller: controller.etGender,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.arrow_drop_down),
              labelText: 'Jenis Kelamin',
              hintText: 'Pilih Jenis Kelamin',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onTap: () => Get.bottomSheet(chooseGender(context)),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: controller.schoolGradeTextController,
            decoration: InputDecoration(
              labelText: 'Kelas',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: controller.schoolNameTextController,
            decoration: InputDecoration(
              labelText: 'Sekolah',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 26),
          CommonButton(
            onPressed: () async => await controller.updateData(UserRegistrationRequest(
                fullName: controller.fullNameTextController.text,
                email: controller.emailTextController.text,
                gender: controller.etGender.text,
                schoolGrade: controller.schoolGradeTextController.text,
                schoolName: controller.schoolNameTextController.text,
                schoolLevel: GeneralValues.defaultJenjang,
                photoUrl: GeneralValues.defaultPhotoURL)),
            text: 'Perbarui Data',
          ),
        ],
      );
    }
  }

  Widget chooseGender(BuildContext context) {
    return Container(
      color: AppColors.grayscaleOffWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text(GeneralValues.genderM),
            onTap: () => controller.onSelectedGender(
              value: true,
              onSelected: () => Get.back(),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text(GeneralValues.genderF),
            onTap: () => controller.onSelectedGender(
              value: false,
              onSelected: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}
