import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile_edit_controller.dart';

class ProfileEditFormPage<C extends ProfileEditController> extends GetWidget<C> {
  const ProfileEditFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      children: [
        const Text(
          'Data Diri',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        TextField(
          controller: TextEditingController(text: controller.args.name),
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
          decoration: InputDecoration(
            labelText: 'Sekolah',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => onUpdateData(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff3A7FD5),
          ),
          child: const Text('Perbarui Data'),
        ),
      ],
    );
  }

  void onUpdateData() {
    debugPrint('Ditekan onUpdateData');
    Get.back();
  }

  Widget chooseGender(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Laki - laki'),
            onTap: () => controller.onSelectedGender(
              value: true,
              onSelected: () => Get.back(),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('Perempuan'),
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