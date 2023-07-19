import 'package:cached_network_image/cached_network_image.dart';
import 'package:edspert_flutter_final_project_elearning/presentation/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/model/user.dart';
import '../dashboard_controller.dart';
import 'edit/profile_edit_page.dart';
import 'profile_controller.dart';

class ProfilePage<C extends ProfileController> extends GetView<C> {
  static const routeName = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Akun Saya',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: AppColors.grayscaleOffWhite)),
      backgroundColor: AppColors.primary,
      centerTitle: true,
      actions: [
        GetBuilder<DashboardController>(
          builder: (controller) {
            return TextButton(
              onPressed: () => redirectToEditPage(controller.currentUser!),
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: AppColors.grayscaleOffWhite,
                ),
              ),
            );
          }
        ),
      ],
      bottom: buildBottomAppBar(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    );
  }

  void redirectToEditPage(User args) => Get.toNamed(
        ProfileEditPage.routeName,
        arguments: args,
      );

  PreferredSizeWidget buildBottomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(Get.width, 120),
      child: GetBuilder<DashboardController>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(24),
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                          controller.currentUser?.userName ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            color: AppColors.grayscaleOffWhite,
                          ),
                        ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                          controller.currentUser?.userAsalSekolah ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.grayscaleOffWhite,
                          ),
                        ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                        imageUrl: controller.currentUser?.userFoto ?? '',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.person, color: AppColors.grayscaleOffWhite),
                      ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 18,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              decoration: BoxDecoration(
                color: AppColors.grayscaleOffWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: 7,
                    spreadRadius: 0,
                    color: Colors.black.withOpacity(0.25),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Identitas Diri',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  buildContentProfile(
                        context: context,
                        title: 'Nama Lengkap',
                        value: controller.currentUser?.userName ?? '',
                      ),
                  buildContentProfile(
                        context: context,
                        title: 'Email',
                        value: controller.currentUser?.userEmail ?? '',
                      ),
                  buildContentProfile(
                        context: context,
                        title: 'Jenis Kelamin',
                        value: controller.currentUser?.userGender ?? '',
                      ),
                  buildContentProfile(
                        context: context,
                        title: 'Kelas',
                        value: controller.currentUser?.kelas ?? '',
                      ),
                  buildContentProfile(
                        context: context,
                        title: 'Sekolah',
                        value: controller.currentUser?.userAsalSekolah ?? '',
                      ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            buildLogoutSection(
              context: context,
              onTap: () => onLogoutPressed(),
            ),
          ],
        );
      }
    );
  }

  Widget buildContentProfile({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16)
      ],
    );
  }

  Widget buildLogoutSection({
    required BuildContext context,
    required GestureTapCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 18),
        decoration: BoxDecoration(
          color: AppColors.grayscaleOffWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 6,
                spreadRadius: 0,
                offset: const Offset(0, 0))
          ],
        ),
        child: const Row(
          children: [
            Icon(Icons.exit_to_app, color: AppColors.error //Color(0xffEB5757),
                ),
            SizedBox(width: 6),
            Text(
              'Keluar',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.error //Color(0xffEB5757),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void onLogoutPressed() {
    Get.dialog(
      Dialog(
        child: Wrap(
          children: [
            Column(
              children: [
                const SizedBox(height: 32),
                const Text('Kamu Yakin ingin Keluar?'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 32),
                    Expanded(
                      child: CommonButton(
                        onPressed: () {
                          Get.back();
                        },
                        text: 'Tidak',
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: CommonButton(
                          onPressed: () {
                            Get.back();
                            controller.signOut();
                          },
                          text: 'Ya',
                          textColor: AppColors.primary,
                          backgroundColor: Colors.transparent,
                          borderColor: AppColors.primary),
                    ),
                    const SizedBox(width: 32),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
    // Get.bottomSheet(
    //   Wrap(
    //     children: [
    //       Column(
    //         children: [
    //           const SizedBox(height: 16),
    //           const Text('Logout?'),
    //           const SizedBox(height: 16),
    //           Row(
    //             children: [
    //               const SizedBox(width: 32),
    //               Expanded(
    //                 child: OutlinedButton(
    //                   onPressed: () {
    //                     Get.back();
    //                   },
    //                   child: const Text('Tidak'),
    //                 ),
    //               ),
    //               const SizedBox(width: 32),
    //               Expanded(
    //                 child: ElevatedButton(
    //                     onPressed: () {
    //                       Get.back();
    //                       controller.signOut();
    //                     },
    //                     child: const Text('Ya')),
    //               ),
    //               const SizedBox(width: 32),
    //             ],
    //           ),
    //           const SizedBox(height: 32),
    //         ],
    //       ),
    //     ],
    //   ),
    //   backgroundColor: AppColors.grayscaleOffWhite,
    // );
  }
}