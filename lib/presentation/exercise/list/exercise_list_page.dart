import 'package:cached_network_image/cached_network_image.dart';
import 'package:edspert_flutter_final_project_elearning/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../data/model/exercise.dart';
import '../../../routes/routes.dart';
import 'exercise_list_controller.dart';

/// Arguments untuk dibawa saat pindah/navigate ke halaman ExerciseListPage
class ExerciseListPageArgs {
  final String courseId;
  final String courseName;

  const ExerciseListPageArgs({
    required this.courseId,
    required this.courseName,
  });
}

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({Key? key}) : super(key: key);

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  @override
  void initState() {
    super.initState();
    // Call API
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseListController>(
      builder: (ExerciseListController controller) {
        List<Exercise> exercises = controller.exerciseList;

        return Scaffold(
            backgroundColor: AppColors.grayscaleBackground,
            appBar: AppBar(
              title: Text(controller.courseName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18)),
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.grayscaleOffWhite,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih Paket Soal',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: controller.isExerciseListLoading
                        ? const Center(child: CircularProgressIndicator())
                        : exercises.isEmpty
                            ? Center(
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AssetImages.imgNoPackageSvg),
                                  const Text('Yah, Paket tidak tersedia',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(height: 8),
                                  const Text(
                                      'Tenang, masih banyak yang bisa kamu pelajari. cari lagi yuk!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.grayscalePlaceholder,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500))
                                ],
                              ))
                            : GridView.builder(
                                // padding: const EdgeInsets.all(20),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 153 / 96,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 12,
                                ),
                                itemCount: exercises.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.exerciseQuestionsForm,
                                          arguments:
                                              exercises[index].exerciseId);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: AppColors.grayscaleOffWhite,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: const BoxDecoration(
                                                  color: AppColors
                                                      .grayscaleBackground,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: CachedNetworkImage(
                                                  imageUrl:
                                                      exercises[index].icon ??
                                                          '',
                                                  width: 14,
                                                  height: 14,
                                                  fit: BoxFit.cover)),
                                          Text(
                                              exercises[index].exerciseTitle ??
                                                  '',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700)),
                                          Text(
                                            '${exercises[index].jumlahDone}/${exercises[index].jumlahSoal} Soal',
                                            style: const TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors
                                                    .grayscalePlaceholder),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                  )
                ],
              ),
            ));
      },
    );
  }
}