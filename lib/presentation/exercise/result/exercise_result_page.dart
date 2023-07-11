import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import 'exercise_result_controller.dart';

class ExerciseResultPage extends GetView<ExerciseResultController> {
  const ExerciseResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
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
              const Text(
                'Selamat',
                style: TextStyle(
                  color: AppColors.grayscaleOffWhite,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Nilai Kamu: ${controller.resultScore}',
                style: const TextStyle(
                  color: AppColors.grayscaleOffWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}