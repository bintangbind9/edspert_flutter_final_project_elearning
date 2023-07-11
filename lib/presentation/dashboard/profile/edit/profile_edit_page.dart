import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/profile_edit_form_page.dart';
import 'profile_edit_controller.dart';

class ProfileEditArgs {
  final String name;
  final String email;
  final String jenisKelamin;
  ProfileEditArgs({
    required this.name,
    required this.email,
    required this.jenisKelamin,
  });
}

class ProfileEditPage<C extends ProfileEditController> extends GetView<C> {
  static const routeName = '/profile/edit';

  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Edit Akun'),
      centerTitle: true,
      backgroundColor: const Color(0xff3A7FD5),
    );
  }

  Widget buildBody(BuildContext context) {
    return ProfileEditFormPage<C>();
  }
}