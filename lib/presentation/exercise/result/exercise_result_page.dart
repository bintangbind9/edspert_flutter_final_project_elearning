import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/asset_images.dart';
import 'exercise_result_controller.dart';

class ExerciseResultPage extends GetView<ExerciseResultController> {
  const ExerciseResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.close_outlined,
                          color: AppColors.grayscaleOffWhite,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Tutup',
                          style: TextStyle(color: AppColors.grayscaleOffWhite),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  controller.isSuccessGetResult ? 'Selamat' : 'Mohon maaf,',
                  style: const TextStyle(
                    color: AppColors.grayscaleOffWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                    controller.isSuccessGetResult
                        ? 'Kamu telah menyelesaikan Kuiz ini'
                        : controller.getResultMessage,
                    style: const TextStyle(
                        color: AppColors.grayscaleOffWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center),
                const SizedBox(height: 36),
                SvgPicture.asset(AssetImages.imgChampionSvg),
                const SizedBox(height: 36),
                const Text(
                  'Nilai Kamu:',
                  style: TextStyle(
                    color: AppColors.grayscaleOffWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  controller.resultScore,
                  style: const TextStyle(
                    color: AppColors.grayscaleOffWhite,
                    fontSize: 96,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}