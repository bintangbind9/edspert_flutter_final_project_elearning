import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_edit_page.dart';

class ProfileEditController extends GetxController {
  final etGender = TextEditingController();

  final _selectedGender = Rx<bool?>(null);

  bool? get selectedGender => _selectedGender.value;

  late ProfileEditArgs args;

  @override
  void onInit() {
    args = Get.arguments as ProfileEditArgs;

    super.onInit();
  }

  void onSelectedGender({
    required bool value,
    Function? onSelected,
  }) {
    _selectedGender.value = value;
    etGender.text = (value) ? 'Laki - laki' : 'Perempuan';
    onSelected?.call();
  }
}