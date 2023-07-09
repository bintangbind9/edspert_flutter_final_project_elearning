import 'package:edspert_flutter_final_project_elearning/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/constants.dart';
import '../../widgets/social_login_button.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscaleBackground,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login',
                style: Styles.largeText24,
              ),
            ),
            const SizedBox(height: 30),
            SvgPicture.asset(
              AssetImages.imgIllustrationLoginSvg,
              height: 255,
            ),
            const SizedBox(height: 40),
            const Text(
              'Selamat Datang',
              style: TextStyle(
                color: AppColors.grayscaleBody,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
              style: TextStyle(
                color: AppColors.grayscaleBody,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            // const Expanded(child: SizedBox.shrink()),
            const SizedBox(height: 100),
            SocialLoginButton(
              text: 'Masuk dengan Google',
              iconAsset: AssetImages.iconGooglePng,
              outlineBorderColor: AppColors.mint,
              onPressed: () async {
                await Get.find<LoginController>().onGoogleSignIn();
              },
            ),
            const SizedBox(height: 25),
            SocialLoginButton(
              text: 'Masuk dengan Apple ID',
              iconAsset: AssetImages.iconApplePng,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              onPressed: () {},
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}