import 'package:edspert_flutter_final_project_elearning/core/constants/app_colors.dart';
import 'package:edspert_flutter_final_project_elearning/core/constants/asset_images.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(AssetImages.imgEdspertLogoWhitePng),
      ),
    );
  }
}