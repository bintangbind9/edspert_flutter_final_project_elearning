import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import 'components/profile_edit_form_page.dart';
import 'profile_edit_controller.dart';

class ProfileEditPage<C extends ProfileEditController> extends GetView<C> {
  static const routeName = '/profile/edit';

  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(context),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.chevron_left)),
      title: const Text('Edit Akun',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
      centerTitle: true,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.grayscaleOffWhite,
    );
  }

  Widget buildBody(BuildContext context) {
    return ProfileEditFormPage<C>();
  }
}